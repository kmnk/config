#Requires AutoHotkey v2.0
#SingleInstance Force

; SC064 : F13 (CapsLock が割り当てられていることを前提としてる)
*SC064::Escape

; SC07B : 無変換
SC064 & SC07B::^
+SC07B::~

; SC079 : 変換
SC064 & SC079::-
+SC079::_

; SC070 : カタカナ
SC064 & SC070::=
+SC070::+

; SC028 : コロン
SC064 & SC028::`
SC028::'
+SC028::"

; SC027 : セミコロン
SC064 & SC027::SC027
SC027::Enter
+SC027::SC028

; /
SC064 & /::\

; Others
;+Space::| ; これは Windows では外してもいいかもしれない

; 104
+1::!
+2::@
;+3::#
;+4::$
;+5::%
+6::^
+7::&
+8::*
+9::(
+0::)
@::[
[::]


; ここで SC064 : F13 ( CapsLock ) を実質 Control として動作させる
#HotIf GetKeyState("SC064", "p")
h::BS
s::^s
x::^x
c::^c
v::^v
u::^u
r::^r
d::^d
!h::Left
!j::Down
!k::Up
!l::Right
