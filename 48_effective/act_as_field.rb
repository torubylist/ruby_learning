require 'active_support/concern'
module EggConcern
  def append_features base
    super
    base.instance_eval(&@_class_methods)
    base.class_eval(&@_class_instances)
  end

  def included base=nil,&block
    super
    @_class_instances = block
  end

  def class_methods base=nil,&block
    @_class_methods = block
  end

end
module ActAsField

  extend EggConcern
  included do 
     @@act_as_fields = []
  end

=begin
  def self.included base
    base.extend ClassMethods
    base.include InstanceMethods

    base.class_eval do 
      @@act_as_fields = []
    end
  end
=end
 
#  module ClassMethods  
  class_methods do 
    def field name,path
      r = class_variable_get(:@@act_as_fields)
      r << name.to_sym
      class_variable_set(:@@act_as_fields, r)

      # self.act_as_fields << name.to_sym

      define_method(name) do 
        case path
        when String
          path.split('.').inject(self.latest_data){|data,key| data[key]}
        when Proc
          path.call(self)
        end
      end
    end
  end

#  module InstanceMethods
    def act_as_fields
      self.class.class_variable_get(:@@act_as_fields)
    end
end



class Device


  include ActAsField

  field "device_type", "device_type"
  field :battery, "data.battery"
  field :node_info , "data.node_info"

  field :battery_to_text, proc {|d|
    "#{d.battery}%"
  }

  def latest_data
    {
      "data" => {
        "node_info" => "this is a sensor",
        "battery" => 90
      },
      "device_type" => "Sensor"
    }
  end

end

d = Device.new
p d.node_info
p d.battery_to_text
p d.act_as_fields
