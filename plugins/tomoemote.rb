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

# Funpost plugin for Cinch.
class Cinch::Tomoemote
  include Cinch::Plugin

  match(/kfarathumbs/, method: :on_kfarathumbs)
  match(/kfarathumbs2/, method: :on_kfarathumbs2)
  match(/kfarafinger/, method: :on_kfarafinger)
  match(/denko/, method: :on_denko)
  match(/abearalien/, method: :on_abearalien)
  match(/denkofinger/, method: :on_denkofinger)
  match(/sad/, method: :on_sad)
  match(/tableflip/, method: :on_tableflip)
  match(/dead/, method: :on_dead)
  match(/mad/, method: :on_mad)
  match(/fade/, method: :on_fade)
  match(/oh/, method: :on_oh)
  match(/kfo/, method: :on_kfo)
  match(/cat1/, method: :on_cat1)
  match(/cat2/, method: :on_cat2)
  match(/cat3/, method: :on_cat3)
  match(/cat4/, method: :on_cat4)
  match(/oh2/, method: :on_oh2)
  match(/devil/, method: :on_devil)
  match(/kfaradevil/, method: :on_kfaradevil)
  match(/kfcat/, method: :on_kfcat)
  match(/shrug/, method: :on_shrug)
  match(/pedo/, method: :on_pedo)
  match(/gender/, method: :on_gender)
  #match(/deflemask/, method: :on_deflemask)
  match(/doxic/, method: :on_doxic)
  match(/whatisthis/, method: :on_whatisthis)
  match(/fuchs/, method: :on_fuchs)
  match(/shit/, method: :on_shit)
  match(/that/, method: :on_that)
  match(/fuck/, method: :on_fuck)
  match(/gift/, method: :on_gift)
  match(/coffee/, method: :on_coffee)

  set :help, <<-HELP
  [prefix]kfarathumbs
  [prefix]kfarathumbs2
  [prefix]kfarafinger
  [prefix]denko
  [prefix]abearalien
  [prefix]denkofinger
  [prefix]sad
  [prefix]tableflip
  [prefix]dead
  [prefix]mad
  [prefix]fade
  [prefix]oh
  [prefix]kfo
  [prefix]cat1
  [prefix]cat2
  [prefix]cat3
  [prefix]cat4
  [prefix]oh2
  [prefix]devil
  [prefix]kfaradevil
  [prefix]kfcat
  [prefix]shrug
  [prefix]pedo
  [prefix]gender
  [prefix]doxic
  [prefix]whatisthis
  [prefix]fuchs
  [prefix]shit
  [prefix]that
  [prefix]fuck
  [prefix]gift
  [prefix]coffee
  HELP

  def on_kfarathumbs(msg)
    msg.reply("( \u00afu\u00af)-b")
  end

  def on_kfarathumbs2(msg)
    msg.reply("( =u=)b")
  end

  def on_kfarafinger(msg)
    msg.reply("( \u00afu\u00af)-\u51f8")
  end

  def on_denko(msg)
    msg.reply("(\u00b4\u30fb\u03c9\u30fb\u0060)")
  end

  def on_abearalien(msg)
    msg.reply("(\u00b4\u03a6\u03c9\u03a6\u0060)")
  end

  def on_denkofinger(msg)
    msg.reply("(\u00b4\u30fb\u03c9\u30fb\u0060)\u51f8")
  end

  def on_sad(msg)
    msg.reply("( \uff9f\u005e\uff9f)")
  end

  def on_tableflip(msg)
    msg.reply("\u0028\u256f\u00b0\u25a1\u00b0\u0029\u256f\ufe35 "\
      "\u253b\u2501\u253b")
  end

  def on_dead(msg)
    msg.reply("＿(:3 ｣\u2220 )＿")
  end

  def on_derp(msg)
    msg.reply("\u30fd\u0028 \uff9f \u30ef \u3002\u0029\u30ce")
  end

  def on_mad(msg)
    msg.reply("(\u3000\uff40\u30fc\u00b4)")
  end

  def on_fade(msg)
    msg.reply("(\u00b4\u30fb\u03c9:;.:...")
  end

  def on_oh(msg)
    msg.reply("( \uff9f\u0414\uff9f\u0029)")
  end

  def on_kfo(msg)
    msg.reply("-\u03c9-")
  end

  def on_cat1(msg)
    msg.reply("\uff3c\u0028\u003d\u005e\u2025\u005e"\
      "\u0029\u002f\u2019\u0060")
  end

  def on_cat2(msg)
    msg.reply("\u0028\u005e\uff65\u006f\uff65\u005e"\
      "\u0029\uff89\u201d")
  end

  def on_cat3(msg)
    msg.reply("\u007e\u0028\u003d\u005e\uff65\u03c9"\
      "\uff65\u005e\u0029\uff8d \u003e\uff9f\u0029\u0029\u0029\u5f61")
  end

  def on_cat4(msg)
    msg.reply("\u007e\u0028\u003d\u005e\uff65\uff65\u005e\u0029"\
      "\uff89\u003e\uff9f\u0029\u0023\u0023\u0029\u5f61")
  end

  def on_oh2(msg)
    msg.reply("(;\uff9f\u0414\uff9f\u0029)")
  end

  def on_devil(msg)
    msg.reply("(\u5c6e\uff9f\u0414\uff9f)\u5c6e")
  end

  def on_kfaradevil(msg)
    msg.reply("\uff08\uffe3\uff57\uffe3\uff09\u03a8")
  end

  def on_kfcat(msg)
    msg.reply("(=^-\u03c9-^=)\uff89")
  end

  def on_shrug(msg)
    msg.reply("\u00af\u005c_(\u30c4)_/\u00af")
  end

  def on_pedo(msg)
    msg.reply("\u0295\u2022\u1d25\u2022\u0294")
  end

  def on_gender(msg)
    msg.reply("What do u think ur doin??? (Dont)")
  end

  def on_doxic(msg)
    msg.reply("\x0308,06You are fired.")
  end

  def on_whatisthis(msg)
    msg.reply("8-bit poop crap. Now leave.")
  end

  def on_fuchs(msg)
    msg.reply("Fuch you, Fred Fuchs fuching suchs.")
  end

  def on_shit(msg)
    msg.reply("http://giraffopia.files.wordpress.com/2010/10/"\
      "dog-pooping-on-president-clinton.jpg")
  end

  def on_that(msg)
    msg.reply("https://www.youtube.com/watch?v=wCDIYvFmgW8")
  end

  def on_fuck(msg)
    msg.reply("You sicko. Go wash your mouth with soap!")
  end

  def on_gift(msg)
    msg.reply("https://www.mattandreko.com/images/brainpan2_preview.png")
  end

  def on_coffee(msg)
    msg.reply("http://lifeisreallybeautiful.com/wp-content/"\
      "uploads/2010/09/star-fucks-coffee1.jpg")
  end
end