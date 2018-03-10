# -*- coding: utf-8 -*-
#
# = Cinch calculation utilities plugin
# This plugin adds a bunch of calculation commands,
# mostly pertinent to chiptune.
# 
# == Commands
# (to be added later)
#
# == Dependencies
# None.
#
# == Configuration
# None.
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

# Calculation utilities plugin for Cinch.
class Cinch::Harutils
  include Cinch::Plugin

  match /amkspeed ?(.*)/, :method => :on_amkspeed
  match /clockspeed ?(.*) (.*)/, :method => :on_clockspeed
  match /tickspeed ?(.*) (.*)/, :method => :on_tickspeed

  set :help, <<-HELP
[prefix]amkspeed <tempo>
  Calculates AMK speed value based on tempo in BPM.
[prefix]clockspeed <tempo> <speed>
  Calculates clock rate, given tempo in BPM and speed in ticks per row/unit.
[prefix]tickspeed <tempo> <clock>
  Calculates tick speed, given tempo in BPM and clock rate in Hz.
  HELP

  def on_amkspeed(msg, tempo)
    tempo = Float(tempo) rescue nil
    if tempo.nil?
      msg.safe_reply "Usage: #{bot.config.plugins.prefix}amkspeed <tempo>"
    elsif tempo < 0
      msg.safe_reply "Sorry, #{msg.user.nick}, you can't have a tempo less than 0."
    else
      amkspeed = tempo * 256.0 / 625.0
      if (amkspeed.round) == amkspeed
        msg.safe_reply "Given tempo #{tempo}, the AMK speed is %d." % [amkspeed]
      else
        msg.safe_reply "The AMK speed is about %d. The yielded tempo would be %.3f BPM." % [amkspeed, amkspeed.round * 625.0 / 256.0]
      end
    end
  end

  def on_clockspeed(msg, tempo, speed)
    tempo = Float(tempo) rescue nil
    speed = Float(speed) rescue nil
    if tempo.nil? || speed.nil?
      msg.safe_reply "Usage: #{bot.config.plugins.prefix}clockspeed <tempo> <speed>"
    elsif (tempo < 0) || (speed < 0)
      msg.safe_reply "Sorry, #{msg.user.nick}, you can't make time go backwards."
    else
      clockspeed = tempo * speed / 15.0
      msg.safe_reply "The clock speed is #{clockspeed} Hz."
    end
  end

  def on_tickspeed(msg, tempo, clock)
    tempo = Float(tempo) rescue nil
    clock = Float(clock) rescue nil
    if tempo.nil? || clock.nil?
      msg.safe_reply "Usage: #{bot.config.plugins.prefix}tickspeed <tempo> <clock>"
    elsif (tempo < 0) || (clock < 0)
      msg.safe_reply "Sorry, #{msg.user.nick}, you can't make time go backwards."
    else
      tickspeed = tempo * clock / 15.0
      msg.safe_reply "The tick speed is #{tickspeed}."
    end
  end
end
