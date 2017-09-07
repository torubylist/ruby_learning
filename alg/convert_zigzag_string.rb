def convert(s, num_rows)
    if num_rows == 1
        return s
    end
    sb   = ''
    new = ''
    magic = 2 * num_rows - 2
    initial_instance = magic
    (0...num_rows).each do |i|
        new += fill(sb, i, magic, initial_instance, s)
        initial_instance = initial_instance - 2
    end
    new 
end

def fill(sb,start,magic,initial_instance,s)
    new = sb
    while start < s.size do
        if initial_instance == 0
            initial_instance = magic
        end
        new += s[start]
        start = start + initial_instance
        initial_instance = magic - initial_instance
    end
    new
end
p convert("PAYPALISHIRING",3)
