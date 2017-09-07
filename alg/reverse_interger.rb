BIT = 32
MAX = 2 ** (BIT -1) - 1
MIN = - 2 ** BIT
def reverse(x)
  return -reverse(-x) if x < 0

  sum = 0
  while x > 0
    sum = sum * 10 + x % 10
    x = x / 10
  end
  sum > MAX ? 0 : sum
end
