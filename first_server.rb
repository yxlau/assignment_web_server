require 'socket'
# IP address is 0.0.0.0 and it's on port 8080:
server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept   # Open connection
  inputline = connection.gets  # Read from connection
  puts "We have received a request that looked like #{inputline}"
  connection.print "HTTP/1.1 200 OK\r\n" +
    "Content-Type: text/html\r\n" +
    "Connection: close\r\n\r\n"
  File.readlines('hello_world.html').each do |line|
    connection.puts line
  end
  connection.close             # Close connection
end
