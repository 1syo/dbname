require 'action_controller/railtie'

app = Class.new(Rails::Application)
app.config.active_support.deprecation = :log
app.initialize!
