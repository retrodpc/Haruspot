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
    if m.message =~ /^ok/i
      m.reply "Oh, okay."
    elsif m.message =~ /case in point/i
      m.reply "\uD83D\uDC49\uD83D\uDCBC point in case"
    elsif m.message =~ /noticable/i
      m.reply "notiwire >:C"
    elsif m.message =~ /staph/i
      m.reply "ylcoccus"
    end
  end

end
