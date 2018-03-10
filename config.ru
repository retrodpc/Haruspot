require 'cinch'
require_relative 'plugins/harucore'
require_relative 'plugins/harutils'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.esper.net"
    c.verbose = true
    c.nick = "Haruspot"
    c.channels = ["#worms_badposting", "#savespam"]
    c.plugins.plugins = [Cinch::Harucore, Cinch::Harutils]
    c.plugins.prefix = "?"
  end

end

bot.start
