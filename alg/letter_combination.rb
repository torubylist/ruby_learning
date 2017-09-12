def letter_combination(digits)
  dict = {'2': ['a','b','c'],
          '3': ['d','e','f'],
          '4': ['g','h','i'],
          '5': ['j','k','l'],
          '6': ['m','n','o'],
          '7': ['p','q','r','s'],
          '8': ['t','u','v'],
          '9': ['w','x','y','z']
  }
  res = []
  length = digits.size
  if length == 0
    return res
  end
  dfs(0,'',res,length)
  return res
end
def dfs(num, string, res, length)
  if num == length
    res.append(string)
    return
  end
end
