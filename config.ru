require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.esper.net"
    c.nick = "Haruspot"
    c.channels = ["#worms_badposting"]
  end

  on :message, /^[Oo][Kk].*/ do |m|
    m.reply "Oh, okay, #{m.user.nick}."
  end
end

bot.start