module Kafka
  module Ext
    def ensure_snappy!
      if @snappy.nil?
        begin
          require 'snappy'
          @snappy = Object.const_defined? "Snappy"
        rescue LoadError
          @snappy = false
        end
      end
      
      if @snappy
        yield
      else
        fail "Snappy not available!"
      end
    end
  end
end