require 'active_support/all'

module ActAsField
  def self.included base
    base.send :extend, ClassMethods

    base.class_eval do 
      cattr_accessor :act_as_fied
      self.act_as_field = []
    end

    module ClassMethods
      def field name, path
        self.act_as_field << name

        define_method(name) do 
          case name
          when String
            path.split(".").inject(self.raw_data){|data,key| data[key]}
          when Proc
            path.call(self)
          end
        end
      end
    end

  end

end

class Product
  include ActAsFields

  field :title, "data.title"
  field :power, "meta.power"
  field :duration, "meta.duration"
  filed :power_usage, proc { |record| record.power / record.duration }

  def raw_data
    {
      "data" => {
        "title" => "switch 1"
      },
      "meta" => {
        "power"  => 200,
        "duration" => 20
      }
    }
  end
end

product = Product.new
p product.title
p product.power
