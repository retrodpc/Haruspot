class Cinch::Harucore
  include Cinch::Plugin
  
  listen_to :channel, :method => :on_channel

  match /ping/, :method => :on_ping, :react_on => :channel
  match /violin/, :method => :on_violin, :react_on => :channel
  match /aaa/, :method => :on_aaa, :react_on => :channel

  set :help, <<-HELP
prefixping
  Replies with "Pong!"
prefixviolin
  Ever wondered what a violin is? Well now find out!
prefixaaa
  For when you just can't contain the pain within.
  HELP

  def on_ping(m)
    m.reply("Pong!")
  end
  
  def on_violin(m)
    m.reply("The violin (violin) is a kind of a super clean orchestra played to ring carry instruments. It is widely spread all over the world, is the modern orchestra string of the main instrument. In the music it plays very important position, is the pillar of the modern symphony orchestra, but also has the difficult playing skills solo instrument.The emergence of modern violin has been 300 years")
  end

  def on_aaa(m)
    m.reply("https://cdn.discordapp.com/attachments/190191670304833536/201368263203094528/10a.png")
  end

  def on_channel(m)
    if m.message =~ /^ok/i
      m.reply "Oh, okay."
    elsif m.message =~ /case in point/i
      m.reply "point in case"
    elsif m.message =~ /noticable/i
      m.reply "notiwire >:C"
    elsif m.message =~ /staph/i
      m.reply "ylcoccus"
    end
  end

end
