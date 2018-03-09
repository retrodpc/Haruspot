require 'cinch'

class Hello
  include Cinch::Plugin

  match "hello"

  def execute(m)
    m.reply "Hello, #{m.user.nick}"
  end
end

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.esper.net"
	c.verbose = true
    c.nick = "Haruspot"
    c.channels = ["#worms_badposting"]
  end

  helpers do
    def is_admin?(user)
      true if user.nick == "Blaziken|420"
    end
  end

  on :message, /^(<.*> )*[Oo][Kk].*/ do |m|
    m.reply "Oh, okay, #{m.user.nick}."
  end
end

bot.start
