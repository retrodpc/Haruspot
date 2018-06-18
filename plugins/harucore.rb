# -*- coding: utf-8 -*-
#
# = Cinch funposting plugin
# This plugin adds a bunch of funposting commands.
#
# == Commands
# (to be added later)
#
# == Dependencies
# JSON: to load the copypasta data.
#
# == Configuration
# Add the following to your bot's configure.do stanza:
#
#   config.plugins.options[Cinch::Harucore] = {
#     shiptoast: ['#channel']
#   }
#
# [channel]
#   List of channels to listen for shiptoast commands.
#
# == Author
# retrodpc (Ivysalt)
#
# == License
# Copyright (c) 2018 Ivysalt
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

require 'json'

# Funpost plugin for Cinch.
class Cinch::Harucore
  include Cinch::Plugin

  # copypastas = JSON.parse(File.read('../data/copypasta.json'))

  # Checks if the given message is in a context approprate for shiptoasting.
  def shiptoast?(msg)
    shiptoast = config[:shiptoast] ? config[:shiptoast] : ['#worms_badposting']
    (!msg.channel? || (shiptoast.include? msg.channel.name))
  end

  # Checks if the given message is not in a context approprate for shiptoasting.
  def not_shiptoast?(msg)
    shiptoast = config[:shiptoast] ? config[:shiptoast] : ['#worms_badposting']
    !(shiptoast.include? msg.channel.name)
  end
  
  listen_to :message, method: :on_message

  match(/ping/, method: :on_ping)
  match(/violin/, method: :on_violin)
  match(/aaa/, method: :on_aaa)
  match(/angry/, method: :on_angry)
  match(/this ?(.*)/, method: :on_this)
  match(/wow ?(.*)/, method: :on_wow)

  set :help, <<-HELP
[prefix]ping
  Replies with 'Pong!'
[prefix]violin
  Ever wondered what a violin is? Well now find out!
[prefix]aaa
  For when you just can't contain the pain within.
[prefix]angry
  Extreme expresion of anger
  HELP

  def on_ping(msg)
    msg.safe_reply('Pong!')
  end
  
  def on_violin(msg)
    return unless shiptoast?(msg)
    msg.safe_reply('The violin (violin) is a kind of a super clean orchestra'\
      ' played to ring carry instruments. It is widely spread all over the '\
      'world, is the modern orchestra string of the main instrument. In the '\
      'music it plays very important position, is the pillar of the modern '\
      'symphony orchestra, but also has the difficult playing skills solo '\
      'instrument.The emergence of modern violin has been 300 years')
  end

  def on_aaa(msg)
    return unless shiptoast?(msg)
    msg.safe_reply('https://cdn.discordapp.com/attachments'\
      '/190191670304833536/201368263203094528/10a.png')
  end

  def on_angry(msg)
    msg.safe_reply("\x1D\x1F\x02>:C\x0F")
  end

  def on_this(msg, length)
    this = this_gen(length)
    msg.safe_reply(this)
  end

  def on_wow(msg, length)
    wow = wow_gen(length)
    msg.safe_reply(wow)
  end

  def on_message(msg)
    return unless shiptoast?(msg)
    if msg.message =~ /^ok/i
      msg.safe_reply 'Oh, okay.'
    elsif msg.message =~ /^オー?ケー?/i
      msg.safe_reply 'wtf ウィーアブーだね？？？'
    end
  end

  # badposting generators below

  # Generates a text penis at a given length
  def this_gen(length = 20)
    length = Integer(length) rescue nil
    if length == nil
      length = 20
    end

    if (length <= 420 && length >= 0)
      this_thing = "8"
      for i in 1..length
        this_thing += "="
      end
      this_thing += "D"
      return this_thing
    elsif (length >= -420 && length < 0)
      this_thing = "D"
      for i in 1..(-length)
        this_thing += "="
      end
      this_thing += "8"
      return this_thing
    else
      return "Sorry bud, but my dick won't fit in here. \x1D: )"
    end
  end

  # Generates a text wow at a given length
  def wow_gen(length = 16)
    length = Integer(length) rescue nil
    if length == nil
      length = 16
    end

    if (length <= 69 && length >= 0)
      wow_thing = "\x02w"
      for i in 1..length
        wow_thing += "\x03%02do" % [i % 16]
      end
      wow_thing += "\x0F\x02w"
      return wow_thing
    elsif (length >= -69 && length < 0)
      wow_thing = "\x02ʍ"
      for i in 1..(-length)
        wow_thing += "\x03%02do" % [i % 16]
      end
      wow_thing += "\x0F\x02ʍ"
      return wow_thing
    else
      return "https://upload.wikimedia.org/wikipedia/en/5/5f/Original_Doge_meme.jpg"
    end
  end
end
