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
      amkspeed = tempo * 256.0 / 625.0
      if (amkspeed.round) == amkspeed
        m.reply("Given tempo #{tempo}, the AMK speed is %f." % [amkspeed])
      else
        m.reply("The AMK speed is about %.0f. The yielded tempo would be %.3f BPM." % [amkspeed, amkspeed.round * 625.0 / 256.0])
      end
    end
  end
  
  #def on_channel(m)
  #end

end
