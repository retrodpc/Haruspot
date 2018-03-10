class Cinch::Harutils
  include Cinch::Plugin

  match /amkspeed (\d+)/, :method => :on_amkspeed, :react_on => :channel
  match /clockspeed (\d+) (\d+)/, :method => :on_clockspeed, :react_on => :channel

  set :help, <<-HELP
cinch amkspeed <tempo>
  Calculates AMK speed value based on tempo in BPM.
cinch clockspeed <tempo> <speed>
  Calculates clock rate, given tempo in BPM and speed in ticks per row/unit.
cinch tickspeed <tempo> <clock>
  Calculates tick speed, given tempo in BPM and clock rate in Hz.
  HELP

  def on_amkspeed(m, tempo)
    tempo = Float(tempo) rescue nil
    if tempo.nil?
      m.reply("Sorry, #{m.user.nick}. That's not a valid input.")
    elsif tempo < 0
      m.reply("Sorry, #{m.user.nick}, you can't have a tempo less than 0.")
    else
      amkspeed = tempo * 256.0 / 625.0
      if (amkspeed.round) == amkspeed
        m.reply("Given tempo #{tempo}, the AMK speed is %d." % [amkspeed])
      else
        m.reply("The AMK speed is about %d. The yielded tempo would be %.3f BPM." % [amkspeed, amkspeed.round * 625.0 / 256.0])
      end
    end
  end

  def on_clockspeed(m, tempo, speed)
    tempo = Float(tempo) rescue nil
    speed = Float(speed) rescue nil
    if tempo.nil? || speed.nil?
      m.reply("Sorry, #{m.user.nick}. That's not a valid input.")
    elsif (tempo < 0) || (speed < 0)
      m.reply("Sorry, #{m.user.nick}, you can't make time go backwards.")
    else
      clockspeed = tempo * speed / 15.0
      m.reply("The clock speed is #{clockspeed} Hz.")
    end
  end

  def on_tickspeed(m, tempo, clock)
    tempo = Float(tempo) rescue nil
    clock = Float(clock) rescue nil
    if tempo.nil? || clock.nil?
      m.reply("Sorry, #{m.user.nick}. That's not a valid input.")
    elsif (tempo < 0) || (clock < 0)
      m.reply("Sorry, #{m.user.nick}, you can't make time go backwards.")
    else
      tickspeed = tempo * clock / 15.0
      m.reply("The tick speed is #{tickspeed}.")
    end
  end
end
