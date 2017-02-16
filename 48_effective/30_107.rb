##recommend to use define_method not method_missing
# class HashProxy
#
#   def initialize
#     @hash ={}
#   end
#
#   private
#
#   def method_missing(name, *args, &block)
#     if @hash.respond_to?(name)
#       @hash.send(name, *args, &block)
#     else
#       super
#     end
#   end
# end

class HashProxy

  Hash.public_instance_methods(false).each do |name|
    defind_method(name) do |*args, &block|
      @hash.send(name, *args, &block)
    end
  end

  def initialize
    @hash  = {}
  end

end

hp = HashProxy.new
p hp.respond_to?(:size)

p hp.size

p hp.public_methods(false)
