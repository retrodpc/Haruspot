require 'cinch'
require_relative 'plugins/harucore'
require_relative 'plugins/harutils'
require_relative 'plugins/help'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.esper.net"
    c.verbose = true
    c.nick = "Haruspot"
    c.user = "Haruspot"
    c.realname = "Haruspot: a Ruby bot based on Cinch"
    c.channels = ["#worms_badposting", "#savespam"]
    c.plugins.plugins = [Cinch::Harucore, Cinch::Harutils, Cinch::Help]
    c.plugins.prefix = "?"
  end

end

bot.start
