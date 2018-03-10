# -*- coding: utf-8 -*-
#
# = Cinch funposting plugin
# This plugin adds a bunch of funposting commands.
#
# == Commands
# (to be added later)
#
# == Dependencies
# None.
#
# == Configuration
# Add the following to your bot’s configure.do stanza:
#
#   config.plugins.options[Cinch::Harucore] = {
#     :shiptoast => ["#channel"]
#   }
#
# [channel]
#   List of channels to listen for shiptoast commands.
#
# == Author
# retrodpc (Ivysalt)
#
# == License
# Copyright © 2018 Ivysalt
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Funpost plugin for Cinch.

class Cinch::Harucore
  include Cinch::Plugin

  def is_shiptoast?(m)
    if config[:shiptoast]
      shiptoast = config[:shiptoast]
    else
      shiptoast = ["#worms_badposting"]
    end
    if !m.channel? || (shiptoast.include? m.channel.name)
      return true
    else
      return false
    end
  end
  
  listen_to :channel, :method => :on_channel

  match /ping/, :method => :on_ping
  match /violin/, :method => :on_violin
  match /aaa/, :method => :on_aaa

  set :help, <<-HELP
[prefix]ping
  Replies with "Pong!"
[prefix]violin
  Ever wondered what a violin is? Well now find out!
[prefix]aaa
  For when you just can't contain the pain within.
  HELP

  def on_ping(m)
    m.reply("Pong!")
  end
  
  def on_violin(m)
    if is_shiptoast? m
      m.reply("The violin (violin) is a kind of a super clean orchestra played to ring carry instruments. It is widely spread all over the world, is the modern orchestra string of the main instrument. In the music it plays very important position, is the pillar of the modern symphony orchestra, but also has the difficult playing skills solo instrument.The emergence of modern violin has been 300 years")
    end
  end

  def on_aaa(m)
    if is_shiptoast? m
      m.reply("https://cdn.discordapp.com/attachments/190191670304833536/201368263203094528/10a.png")
    end
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
