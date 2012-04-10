Mustache.template_path = Rails.root.join('app/templates')

ActionView::Template.register_template_handler :rb, ActionView::Template::Handlers::Mustache


if Rails.env.development?
  # templates reloader
  templates_reloader = ActiveSupport::FileUpdateChecker.new(Dir['app/templates/**/*'], {Rails.root.join('app/templates') => 'mustache'}) do |attrs|
    FileUtils.touch Dir.glob('app/views/**/*{.rb}')
  end

  ActionDispatch::Reloader.to_prepare do
    templates_reloader.execute_if_updated
  end

  Todo::Application.reloaders << templates_reloader
end
