require "socket"
require "./get_news"



server            = "chat.freenode.net"
port              = "6667"
nick              = "GoogleNewsBotCA"
channel           = "#bitmaker"
greeting_prefix   = "privmsg #bitmaker :"
#greetings = "google news"


irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * GoogleNewsBotCA"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
#irc_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  if msg.include? "google news"
    get_news.each do |s| 
        irc_server.puts "PRIVMSG #{channel} " + ":" + s 
    end
  end

end



