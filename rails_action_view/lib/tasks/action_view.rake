namespace :action_view do
  desc 'Render a view directly'
  task :render => :environment do
    raise 'please specify a template!' if ENV['t'].nil?
    template = ENV['t']
    
    view = ActionView::Base.new(Rails.configuration.paths['app/views'])
    view.class_eval do
      include Rails.application.routes.url_helpers
      include ApplicationHelper
    end
    puts view.render(template: template)
  end
end
