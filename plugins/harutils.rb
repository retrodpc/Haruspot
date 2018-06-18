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

  # command handlers
  match(/amkspeed ?(.*)/, method: :on_amkspeed)
  match(/clockspeed ?(.*) (.*)/, method: :on_clockspeed)
  match(/clockspeed$/, method: :on_clockspeed)
  match(/tickspeed ?(.*) (.*)/, method: :on_tickspeed)
  match(/tickspeed$/, method: :on_tickspeed)
  match(/deltapcm ?(.*) (.*)/, method: :on_deltapcm)
  match(/deltapcm$/, method: :on_deltapcm)

  set :help, <<-HELP
[prefix]amkspeed <tempo>
  Calculates AMK speed value based on tempo in BPM.
[prefix]clockspeed <tempo> <speed>
  Calculates clock rate, given tempo in BPM and speed in ticks per row/unit.
[prefix]tickspeed <tempo> <clock>
  Calculates tick speed, given tempo in BPM and clock rate in Hz.
  HELP

  def on_amkspeed(msg, tempo=nil)
    tempo = Float(tempo) rescue nil

    if tempo.nil?
      msg.safe_reply("Usage: #{bot.config.plugins.prefix}amkspeed <tempo>")
    elsif tempo < 0
      msg.safe_reply("Sorry, #{msg.user.nick}, "\
        'I won\'t let you go slower than me.')
    else
      amkspeed = tempo * 256.0 / 625.0
      if amkspeed.round == amkspeed
        msg.safe_reply("Given tempo #{tempo}, the AMK speed is %<speed>d." %
            [tempo: amkspeed])
      else
        msg.safe_reply("The AMK speed is about %<speed>d. The yielded tempo "\
          "would be %.3<tempo>f BPM." % [speed: amkspeed,
          tempo: amkspeed.round * 625.0 / 256.0])
      end
    end
  end

  def on_clockspeed(msg, tempo=nil, speed=nil)
    tempo = Float(tempo) rescue nil
    speed = Float(speed) rescue nil

    if tempo.nil? || speed.nil?
      msg.safe_reply("Usage: #{bot.config.plugins.prefix}clockspeed "\
        '<tempo> <speed>')
    elsif (tempo < 0) || (speed < 0)
      msg.safe_reply("Sorry, #{msg.user.nick}, "\
        'you can\'t make time go backwards.')
    else
      clockspeed = tempo * speed / 15.0
      msg.safe_reply("The clock speed is #{clockspeed} Hz.")
    end
  end

  def on_tickspeed(msg, tempo=nil, clock=nil)
    tempo = Float(tempo) rescue nil
    clock = Float(clock) rescue nil

    if tempo.nil? || clock.nil?
      msg.safe_reply("Usage: #{bot.config.plugins.prefix}tickspeed "\
        '<tempo> <clock>')
    elsif (tempo < 0) || (clock < 0)
      msg.safe_reply("Sorry, #{msg.user.nick}, "\
        'you can\'t make time go backwards.')
    else
      tickspeed = 15 * clock / tempo
      msg.safe_reply("The tick speed is #{tickspeed}.")
    end
  end

  def on_deltapcm(msg, semitone_change=nil, rate=nil)
    semitone_change = Float(semitone_change) rescue nil
    rate = Float(rate) rescue nil

    if semitone_change.nil? || rate.nil?
      msg.safe_reply("Usage: #{bot.config.plugins.prefix}"\
        'deltapcm <semitone_change> <samplerate>')
      return
    elsif (rate > 31250 ) || (rate <= 0)
      msg.safe_reply("Sorry, #{msg.user.nick}, "\
        'Sample rate needs to be between 1 Hz and 31250 Hz.')
      return
    end

    begin
      converted_hex = calc_delta_hex(semitone_change, rate)
    rescue Exception => e
      msg.safe_reply("Error: #{e} Usage: #{bot.config.plugins.prefix}"\
        'deltapcm <semitone_change> <samplerate>')
    end

    if converted_hex == "" # Check if hex value is smaller than 00  
      msg.safe_reply("Error: Underflow ! Usage: "\
        '#{bot.config.plugins.prefix}deltapcm '\
        '<semitone_change> <samplerate>')
    elsif converted_hex.length > 2 # Check hex value larger than FF
      msg.safe_reply("Error: Overflow ! Usage: "\
        '#{bot.config.plugins.prefix}deltapcm '\
        '<semitone_change> <samplerate>')
    else
      if converted_hex.length == 1
        converted_hex = "0" + converted_hex
      end
      msg.safe_reply("Your delta command is: ``20%s``" % [converted_hex])
    end
  end

  # Deflemask SegaPCM Delta command calculator.
  #
  # n = semitone difference, rate = the initial samplerate of your
  # sample in Hz
  def calc_delta_hex(n, rate)
    n = Float(n) rescue nil
    rate = Float(rate) rescue nil

    if n.nil?
      raise "Invalid semitone difference."
    elsif rate.nil?
      raise "Invalid samplerate."
    end

    a = 2.0**(1.0/12.0)		# a = 12-tones in an octave
    fn = rate * (a**n)		# Calculates the freq of the note

    delta = fn / (31250/255)		# 255 is FF in hex
    delta = Integer(delta.round(0))	# Rounds to 0 decimal pts
    return dec_to_hex(delta)		# Converts delta from dec to hex
  end

  # Converts decimal integer to hex string
  def dec_to_hex(dec)
    dec = Integer(dec) rescue nil

    if dec.nil? # error handle
      raise "This isn't an integer I recognise."
    elsif dec == 0 # if dec is already 0 lmao
      return "00"
    end

    hex_digits = "0123456789ABCDEF"
    conversion = ''	# (Re-)initiate string
    # dec referenced as division

    while dec != 0
      remainder = dec % 16
      dec /= 16
      conversion += hex_digits[remainder]
    end

    conversion.reverse!
    return conversion
    end
end
