def counter n
  proc{ n += 1 }
end
a = counter(10)
p a.call
p a.call
p a.call
