#输入IP为XXX.XXX.XXX.XXX格式 
#字符串两端含有空格认为是合法IP 
#字符串中间含有空格认为是不合法IP 
#类似于 01.1.1.1， 1.02.3.4 IP子段以0开头为不合法IP 
#子段为单个0 认为是合法IP，0.0.0.0也算合法IP

def valid_ip_address(s)
  return false if s.nil?
  str = s.strip
  ip_arr = s.split(".")
  return false if ip_arr.size != 4



end
