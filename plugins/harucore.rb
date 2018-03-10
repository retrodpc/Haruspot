class Cinch::Harucore
  include Cinch::Plugin
  
  listen_to :channel, :method => :on_channel

  match /ping/, :method => :on_ping, :react_on => :channel

  set :help, <<-HELP
cinch ping
  Replies with "Pong!"
  HELP

  def on_ping(m)
    m.reply("Pong!")
  end
  
  def on_channel(m)
    if m.message =~ /^[Oo][Kk]/
      m.reply "Oh, okay."
    end
  end

end
