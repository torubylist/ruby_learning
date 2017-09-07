module EggConcern
  def append_features base
    super
    base.instance_eval(&@_class_methods)
    base.class_eval(&@_class_eval)
  end

  def included base=nil, &blk
    super
    @_class_eval = blk
  end

  def class_methods &blk
    @_class_methods = blk
  end

end




module ActAsField
  # require 'active_support/concern'
  extend EggConcern
  included do 
    @@act_as_fields = []
  end

  class_methods do
    def field name,path
     result = class_variable_get(:@@act_as_fields)
     result << name.to_sym
     class_variable_set(:@@act_as_fields,result)

     define_method(name) do
       case path
       when String
         path.split('.').inject(self.latest_data){|data,key|
           data[key]
         }
       when Proc
         path.call(self)
       end
     end
   end
  end

  def act_as_fields
    self.class.class_variable_get :@@act_as_fields
  end
#  def self.included base
#    base.include InstanceMethods
#    base.extend ClassMethods
#
#    base.class_eval do
#      @@act_as_fields = []
#    end
#  end

#  module InstanceMethods
#    def act_as_fields
#      self.class.class_variable_get :@@act_as_fields
#    end
#  end
#
#  module ClassMethods
#    def field name,path
#      result = class_variable_get(:@@act_as_fields)
#      result << name.to_sym
#      class_variable_set(:@@act_as_fields,result)
#
#      define_method(name) do
#        case path
#        when String
#          path.split('.').inject(self.latest_data){|data,key|
#            data[key]
#          }
#        when Proc
#          path.call(self)
#        end
#      end
#    end
#  end

end




class Device
  include ActAsField

  field :device_type, 'device_type'
  field :battery, 'data.battery'
  field :node_info, 'data.node_info'

  field :battery_to_text, proc {|device|
    "{device.battery}%"
  }

  def latest_data

    {
      "data" =>{
        "node_info" => "this is a sensor",
        "battery" => 90
      },
      "device_type" => "Sensor"
    }
  end

end
