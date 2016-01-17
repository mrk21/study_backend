# @see [Fluentd v0.12 Filter プラグインの使い方と作り方 - Qiita]{@link http://qiita.com/sonots/items/25a354b5e8aa524faeef}
module Fluent
  class DupFilter < Filter
    Plugin.register_filter('dup', self)
    
    def configure(conf)
      super
    end
    
    def filter_stream(tag, es)
      new_es = MultiEventStream.new
      es.each { |time, record|
        begin
          new_es.add(time, record)
          new_es.add(time, record) # ここを増やしただけ！
        rescue => e
          router.emit_error_event(tag, time, record, e)
        end
      }
      new_es
    end
  end
end
