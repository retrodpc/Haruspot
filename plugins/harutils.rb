class Cinch::Harutils
  include Cinch::Plugin

  match /amkspeed (.*)/, :method => :on_amkspeed, :react_on => :channel

  set :help, <<-HELP
cinch amkspeed <tempo>
  Calculates AMK speed value based on <tempo>.
  HELP

  def on_amkspeed(m, tempo)
    tempo = Float(tempo) rescue nil
    if tempo.nil?
      m.reply("Sorry, #{m.user.nick}. That's not a valid input.")
    else
      amkspeed = tempo * 256.0 / 625.0
      if (amkspeed.round) == amkspeed
        m.reply("Given tempo #{tempo}, the AMK speed is %d." % [amkspeed])
      else
        m.reply("The AMK speed is about %d. The yielded tempo would be %.3f BPM." % [amkspeed, amkspeed.round * 625.0 / 256.0])
      end
    end
  end

end
