def hano(n,from,depend,to)
  if n == 1
    p "#{from} --> #{to}"
  else
    hano(n-1,from,to,depend)
    move(from,to)
    hano(n-1,depend,from,to)
  end
end

def move(from,to)
  p "#{from} --> #{to}"
end
hano(3,'A','B','C')
