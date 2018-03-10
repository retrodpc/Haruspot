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

  # def zalgo_gen(text)
  # end
  
  listen_to :message, method: :on_message

  match(/ping/, method: :on_ping)
  match(/violin/, method: :on_violin)
  match(/aaa/, method: :on_aaa)

  set :help, <<-HELP
[prefix]ping
  Replies with 'Pong!'
[prefix]violin
  Ever wondered what a violin is? Well now find out!
[prefix]aaa
  For when you just can't contain the pain within.
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

  def on_message(msg)
    return unless shiptoast?(msg)
    if msg.message =~ /^ok/i
      msg.safe_reply 'Oh, okay.'
    if msg.message =~ /^オー?ケー?/i
      msg.safe_reply 'wtf ウィーアブーだよ？？？'
    elsif msg.message =~ /case in point/i
      msg.safe_reply 'point in case'
    elsif msg.message =~ /noticable/i
      msg.safe_reply 'notiwire >:C'
    elsif msg.message =~ /staph/i
      msg.safe_reply 'ylcoccus'
    end
  end

end
