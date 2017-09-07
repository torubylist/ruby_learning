require 'socket'

class Client

  def initialize(ip='127.0.0.1', port=3333)
    @ip, @port = ip,port
  end

  # def send_message(msg)
  #   socket = TCPSocket.new(@ip,@port)
  #   socket.puts(msg)
  #   response = socket.gets
  # ensure
  #   socket.close if socket
  # end
  #
  # def receive_message
  #   socket = TCPSocket.new(@ip,@port)
  #   response = socket.gets
  # ensure
  #   socket.close if socket
  # end
  #
  #
  def send_message(msg)
    connection do |socket|
      socket.puts(msg)
      socket.gets
    end
  end

  def receive_message
    connection do |socket|
      socket.gets
    end
  end
  
  def connection
    socket = TCPSocket.new(@ip,@port)
    yield(socket)
  ensure
    socket.close if socket
  end
end

if __FILE__ == $0
  client = Client.new
  ["Hello", "My name is Greg", "Goodbye"].each do |msg|
    response = client.send_message(msg)
    puts response
  end
end

