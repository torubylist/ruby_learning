#array a have enough space to store all elements.

def merge_two_sorted_array(a,m,b,n)
  i = m + n - 1
  j = m - 1
  k = n -1
  while (i >= 0 ) do
    if(k >= 0 && j >= 0)
      if a[j] > b[k]
        a[i] = a[j]
        j -= 1
      else
        a[i] = b[k]
        k -= 1
      end
    elsif k >= 0
      a[i] = b[k]
      k -= 1
    elsif j >= 0 
      a[i] = a[j]
      j -= 1
    end
    i -= 1
  end
end
