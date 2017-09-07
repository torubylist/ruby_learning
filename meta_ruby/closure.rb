#example 1
# def thrice
#     yield
#     yield
#     yield
# end
=begin
x = 5
puts "value of x before: #{x}";
thrice{ x += 1 }
puts "value of x after: #{x}"
##example2
#
def thrice_with_local_x
  x = 100
  yield
  yield
  yield
  puts "value of x at the end of thrice_with_local_x: #{x}"
end
x = 5
thrice_with_local_x{ x += 1 }
puts "value of outer x after: #{x}"

#example 3
thrice do 
  y = 10
  puts "Is y defind inside the block where it is first set?"
  puts "Yes." if defined? y
end
puts "Is y defined outside the block where it is first set?"
puts "No." unless defined? y
##example 4
def six_times(&block)
  thrice(&block)
  thrice(&block)
end
x = 4
six_times{ x += 10;puts "#{x}" }
puts "value of x after: #{x}"
##example 5
def save_for_later(&b)
  @save = b
end
save_for_later{ puts "Hello!" }
puts "Deferred execution of a block:"
@save.call
@save.call
##example 6
def save_for_late(&b)
  @saved = Proc.new(&b)
end

save_for_late{ puts "Hello again!" }
puts "Defered execution of a proc works just the same with Proc.new:"
@saved.call

###example 7

@saved_proc_new = Proc.new{ puts "I'm declared on the post with Proc.new" }
puts "Defered execution of a proc works just the same with ad-hoc Proc.new:"
@saved_proc_new.call

#example 8
#
@saved_proc_new = Proc.new{ puts "I'm declared with Proc.new" }
@saved_proc     = proc{puts "I'm declared with proc"}
@saved_lambda   = lambda{ puts "I'm delared with lamdba." }
def some_method
  puts "I'm declared as a method."
end
@method_as_closure = method(:some_method)

puts "Here are four superficially identical forms of defered execution:"
@saved_proc_new.call
@saved_proc.call
@saved_lambda.call
@method_as_closure.call


##example 9
def f(closure)
  puts
  puts "About to call closure"
  result = closure.call
  puts "Closure returned: #{result}"
  "Value from f"
end
puts "f returned: " + f(Proc.new{ "Value from Proc.new" })
puts "f returned: " + f(proc{ "Value from proc" })
puts "f returned: " +  f(lambda { "Value from lambda" })
def another_method
  "Value from method"
end
puts "f returned: "+ f(method(:another_method))

##example 10

begin
  f(Proc.new {return "Value from Proc.new"} )
rescue Exception => e
  puts "Failed with #{e.class}: #{e}"
end

##example 11
def g
  result = f(Proc.new{ return "Value from Proc.new" })
  puts "f returned: " + result  #never execute
  "Value from g"                #never execute
end

puts "g returned: #{g}"
##本人的理解：
#在Proce.new中return语句，会尝试返回到创建他的上下文之后，继续执行，如果创建他
#的上下文已经消失或者返回到了全局变量，则会出现LocalJumPError。
#
#在example10中，在全局变量上下文中用Proc.new创建了一个proc。在f方法中调用call，
#然后proc会返回创建他的上下文，即全局上下文，就会出现exception
#
#
#在example11中，在g方法的上下文中用Proc.new创建了一个proc，在f方法中调用call，
#然后proc回返回创建他的上下文，即g方法之后，这种情况不会出现异常。
#
#example12

def make_proc_new
  begin
    Proc.new{ return "Value from Proc.new" }
  ensure
    puts "make_proc_new exited"
  end
end

begin
  puts make_proc_new.call
rescue Exception => e
  puts "Failed with #{e.class}: #{e}"
end

##example 13

def make_lambda
  begin 
    lambda { return "Value from lambda" }
  ensure
    puts "make_lambda exited"
  end
end

puts make_lambda.call


##example 15

def g
  result = f( proc { return "Value from proc" } )
  puts  "f retured: " + result
  "Value from  g"
end

puts "g returned: #{g}"


#example 16
#除了call以外，每个闭包还有一个“arity”方法可以返回期望的参数个数。
puts "One-arg lambda:"
puts (lambda {|x|}.arity)
puts "Three-arg lambda:"
puts (lambda {|x,y,z|}.arity)

puts " No-args lambda:"
puts (lambda {}.arity)
puts "Varargs lambda:"
puts (lambda {|*args|}.arity)
##example17 看看当我们使用不真确的参数个数来调用它们时，会发生什么。
def call_with_too_many_args(closure)
  begin
    puts "closure arity: #{closure.arity}"
    closure.call(1,2,3,4,5)
    puts "Too many args worked."
  rescue Exception => e
    puts "Too many args threw exception #{e.class}: #{e}"
  end
end

def two_args_method(x,y)
end

puts; puts "Proc.new:"; call_with_too_many_args(Proc.new {|x,y|})
puts; puts "proc:"; call_with_too_many_args(proc{|x,y|})
puts; puts "lambada:"; call_with_too_many_args(lambda {|x,y|})
puts; puts "Method:"; call_with_too_many_args(method(:two_args_method))

def call_with_too_few_args(closure)
  begin
    puts "closure arity: #{closure.arity}"
    closure.call()
    puts "Too many args worked."
  rescue Exception => e
    puts "Too many args threw exception #{e.class}: #{e}"
  end 
end

puts; puts "Proc.new:"; call_with_too_few_args(Proc.new {|x,y|})
puts; puts "proc:"; call_with_too_few_args(proc{|x,y|})
puts; puts "lambada:"; call_with_too_few_args(lambda {|x,y|})
puts; puts "Method:"; call_with_too_few_args(method(:two_args_method))

##example 18
def one_args_method(x)
end

puts; puts "Proc.new:"; call_with_too_many_args(Proc.new {|x|})
puts; puts "proc:"; call_with_too_many_args(proc{|x|})
puts; puts "lambada:"; call_with_too_many_args(lambda {|x|})
puts; puts "Method:"; call_with_too_many_args(method(:one_args_method))

puts; puts "Proc.new:"; call_with_too_few_args(Proc.new {|x|})
puts; puts "proc:"; call_with_too_few_args(proc{|x|})
puts; puts "lambada:"; call_with_too_few_args(lambda {|x|})
puts; puts "Method:"; call_with_too_few_args(method(:one_args_method))
##example 20
=end

class LispyEnumerable
  include Enumerable

  def initialize(tree)
    @tree = tree
  end

  def each
    while @tree
      car,cdr = @tree
      yield car
      @tree = cdr
    end
  end
end
=begin
list = [1,[2,[3]]]
LispyEnumerable.new(list).each do |x|
  puts x
end
##example 21
class LazyLispyEnumerable
  include Enumerable

  def initialize(tree)
    @tree = tree
  end

  def each 
    while @tree
      car,cdr = @tree.call
      yield car
      @tree = cdr
    end
  end
end

list = lambda{ [1,lambda{[2,lambda{[3]}]}] }
LazyLispyEnumerable.new(list).each do |x|
  puts x
end


#example 22
list = lambda do
  puts "first lambda called"
  [1,lambda do
    puts "second lambda called"
    [2,lambda do
      puts "third lambda called"
      [3]
    end]
  end]
end
puts "List created; about to iterate:"
LazyLispyEnumerable.new(list).each do |x|
  puts x
end

##example 23

def fib(a,b)
  lambda{[a,fib(b,a+b)]}
end

LazyLispyEnumerable.new(fib(1,1)).each do |x|
  puts x
  break if x > 100
end
=end
class Lazy
  def initialize(&generator)
    @generator = generator
  end

  def method_missing(method, *args, &block)
    evaluate.send(method, *args,&block)
  end

  def evaluate
    @value = @generator.call unless @value
    @value
  end
end

def lazy(&b)
  Lazy.new &b
end

##example 24
# x = lazy do
#   puts "<<< Evaluating lazy value >>>"
#   "lazy value"
# end
#
# puts "x has now been assigned."
# puts "About to call one of x's methods:"
# puts "x.size: #{x.size}"
# puts "x.swapcase: #{x.swapcase}"
#

##example 25

def fibo(a,b)
  lazy { [a, fibo(b,a+b)] }
end

LispyEnumerable.new(fibo(1,1)).each do |x|
  break if x.instance_of?(Lazy) || x > 200
  puts x
end
