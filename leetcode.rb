class Leetcode
  def first_missing_positive(nums)
    h = Array.new( nums.size + 1)
    h[0] = true
    nums.each do |n|
      h[n] = true if n > 0
    end
    h.index(nil) or h.size
  end

  def remove_duplicate_letters(s)
    cs, r = s.chars, []
    h = cs.map.with_index.to_h
    cs.each_with_index do |c, i|
      unless r.include?(c)
        r.pop while r.last && c < r.last && i < h[r.last]
        r << c
        p r
      end
    end
    r.join
  end

  def two_sum(nums,target)
    h =Hash.new()
    nums.each_with_index{|n,i| return [h[n], i+1] if h[n] != nil ;
                         h[target -n ] = i+1 }
  end
  
  def length_of_last_word(str)
    word = str.split(" " )
    word.last ? word.last.length : 0
  end


  ##one method. 
  def add_digits(num)
#    r = num.to_s.chars.map(&:to_i).reduce(:+)
#    r <= 9 ? r : add_digits(r)
     1 + (num -1) % 9 
  end
  ## another method
  #
  #

  def add_binary(a, b )
    (a.to_i(2) + b.to_i(2)).to_a(2)
  end

  def group_anagrams(strs)
    strs.inject(Hash.new([])) do |h,s|
      h(s.chars.sort.join) += [s]
      h
    end.map{|k,v| v.sort}
  end
  
  def single_number(nums)
    nums.inject(:^)
  end

  def majority_element(nums)
    nums.inject([0,0]) { |[x,c] ,i|
      c == 0 || x == i ? [i ,c+1 ] : [x ,c-1]
    }[0]
  end 

  def factorial_traing_zeroes
    n =1000;
    [1,2,3,4].map{|i| n / 5 ** i}.inject(:+)
  end 


end
obj = Leetcode.new
#p obj.first_missing_positive([1,2,3])
#p obj.first_missing_positive([4,3,1,-1])
#p obj.remove_duplicate_letters('cbacdcbc')
#nums = Array[3,5,19,14,32]
#target = 19
#
#p obj.two_sum(nums,target).inspect
p obj.factorial_training_zeroes
