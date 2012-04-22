# monkey patch for activerecord-postgres-array gem
class String

  # Creates an array from a postgres array string that postgresql spits out.
  def from_postgres_array(base_type = :string)
    if empty?
      []
    else
      elements = match(/\{(.*)\}/).captures.first.gsub(/\\"/, '$ESCAPED_DOUBLE_QUOTE$').split(/(,)(?=(?:[^"]|"[^"]*")*$)/).reject {|e| e == ',' }
      elements = elements.map do |e|
        res = e.gsub('$ESCAPED_DOUBLE_QUOTE$', '"').gsub("\\\\", "\\").gsub(/^"/, '').gsub(/"$/, '').gsub("''", "'").strip
        res == 'NULL' ? nil : res
      end

      if base_type == :decimal
        elements.collect(&:to_d)
      elsif base_type == :integer
        elements.collect(&:to_i)
      else
        elements
      end
    end
  end
end