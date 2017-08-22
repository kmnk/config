import sys
import os
import datetime
import subprocess

from keyhac import *

def configure(keymap):

    g = keymap.defineWindowKeymap()

    # キーボード認識ができていないのか keyhac が認識しているキー名と実際のキーが食い違っている
    # 以下に対応を書く
    # DESCRIPTION   -> REALKEY
    # Quote         -> Colon
    # OpenBracket   -> Atmark
    # CloseBracket  -> OpenBracket
    # Plus          -> Caret

    # like 104
    g["Shift-2"] = "OpenBracket"                    # S-2 -> @
    g["Shift-6"] = "Plus"                           # S-6 -> ^
    g["Shift-7"] = "Shift-6"                        # S-7 -> &
    g["Shift-8"] = "Shift-Quote"                    # S-8 -> *
    g["Shift-9"] = "Shift-8"                        # S-8 -> (
    g["Shift-0"] = "Shift-9"                        # S-9 -> )
    g["Shift-Minus"] = "Shift-94"                   # S-- -> _
    g["Plus"] = "Shift-Minus"                       # ^ -> =
    g["Shift-Plus"] = "Shift-Semicolon"             # S-^ -> +
    g["OpenBracket"] = "CloseBracket"               # @ -> [
    g["CloseBracket"] = "BackSlash"                 # [ -> ]
    g["Shift-OpenBracket"] = "Shift-CloseBracket"   # S-@ -> {
    g["Shift-CloseBracket"] = "Shift-BackSlash"     # S-[ -> }
    g["BackSlash"] = "93"                           # ] -> \
    g["Shift-Semicolon"] = "Quote"                  # S-; -> :
    g["Quote"] = "LShift-7"                         # : -> '
    g["Ctrl-Quote"] = "Shift-OpenBracket"           # C-: -> `
    g["Shift-Quote"] = "Shift-2"                    # S-: -> "

    # for human
    g["Ctrl-Slash"] = "93"              # C-/ -> \
    g["Shift-Space"] = "Shift-93"       # C-Space -> |
    g["Ctrl-(102)"] = "Plus"              # S-Eisuu -> ^
    g["Shift-(102)"] = "Shift-Plus"       # S-Eisuu -> ~
    g["Ctrl-(104)"] = "Minus"             # S-Kana -> -
    g["Shift-(104)"] = "Shift-94"         # S-Kana -> _
    g["Ctrl-RCmd"] = "Shift-Minus"      # S-RCmd -> =
    g["Shift-RCmd"] = "Shift-Semicolon" # S-RCmd -> +
    g["Ctrl-RAlt"] = "Shift-Minus"      # S-RCmd -> =
    g["Shift-RAlt"] = "Shift-Semicolon" # S-RCmd -> +

    # for me
    g["Semicolon"] = "Enter"
    g["O-LCtrl"] = "Escape"
    g["LCtrl-LCmd-H"] = "Left"
    g["LCtrl-LCmd-J"] = "Down"
    g["LCtrl-LCmd-K"] = "Up"
    g["LCtrl-LCmd-L"] = "Right"
    g["LCtrl-LCmd-Comma"] = "Back"
    g["LCtrl-LCmd-Back"] = "Delete"
    g["LCtrl-LCmd-Period"] = "Delete"
    g["LCtrl-H"] = "Back"
