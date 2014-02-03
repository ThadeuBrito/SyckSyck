SickSick::Application.configure do
  config.generators do |g|
    g.javascripts false
    g.stylesheets false
    g.template_engine :haml
    g.helper false
    g.integration_tool false
  end
end
