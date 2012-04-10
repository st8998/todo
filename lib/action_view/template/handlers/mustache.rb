require 'action_view'

module ActionView
  module Template::Handlers
    class Mustache

      def self.call(template)
        <<-MUSTACHE
          mustache = ::#{template.virtual_path.classify}.new
          mustache[:view] = self
          mustache[:assigns] = controller.send(:view_assigns)
          mustache[:local_assigns] = local_assigns
          mustache.render.html_safe
        MUSTACHE
      end

    end
  end
end

