class ViewRenderer
  def initialize
    @view = ActionView::Base.new(Rails.configuration.paths['app/views'])
    lambda do |view|
      view.class_eval do
        include Rails.application.routes.url_helpers
        include ApplicationHelper
        
        def protect_against_forgery?
          false
        end
        
        def session
          {}
        end
        
        def cache(*args)
          yield
        end
      end
    end
  end
  
  def render(options, &block)
    view = @view.dup
    @class_definition[view]
    view.class_eval &block if block_given?
    view.render(options)
  end
end
