class Cinch::Harutils
  include Cinch::Plugin
  
  #listen_to :channel, :method => :on_channel

  match /amkspeed (.*)/, :method => :on_amkspeed, :react_on => :channel

  set :help, <<-HELP
cinch amkspeed <tempo>
  Calculates AMK speed value based on <tempo>.
  HELP

  def on_amkspeed(m, tempo)
    tempo = Float(tempo) rescue nil
    if tempo.nil?
      m.reply("Sorry, #{m.user.nick}. That's not a number I recognise.")
    else
      amkspeed = tempo * 256 / 625
      if (amkspeed % 1) == amkspeed
        m.reply("#{m.user.nick}: the AMK speed is %.0d." % [amkspeed])
      else
        m.reply("#{m.user.nick}: the AMK speed is about %.0d. The yielded tempo would be %d" % [amkspeed, (amkspeed * 625 / 256).round])
    end
  end
  
  #def on_channel(m)
  #end

end
