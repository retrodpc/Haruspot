require 'cinch'
require_relative 'plugins/harucore'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.esper.net"
    c.verbose = true
    c.nick = "Haruspot"
    c.channels = ["#worms_badposting"]
    c.plugins.plugins = [Cinch::Harucore]
  end

end

bot.start
