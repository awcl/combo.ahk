#NoEnv
SendMode Input

global ongoingAction

Combo(Key, Seq, Dur) {
    CancelAction(Key, Dur)
    ongoingAction := Key . Seq . Dur
    if (Key != "") {
        SendInput, {%Key% Down}
        Sleep %Dur%
    }
    Loop, Parse, Seq {
        if (ongoingAction != Key . Seq . Dur) {
            if (Key != "")
                SendInput, {%Key% Up}
            ongoingAction := ""
            break
        }
        SendInput, {Blind}{%A_LoopField% Down}
        Sleep %Dur%
        SendInput, {Blind}{%A_LoopField% Up}
        Sleep %Dur%
    }
    if (Key != "")
        SendInput, {%Key% Up}
    ongoingAction := ""
}

CancelAction(Key, Dur) {
    if (ongoingAction != "") {
        Seq := ""
        if (Key != "")
            SendInput, {%Key% Up}
        ongoingAction := ""
    }
}

; Exit script when pressed
Esc::ExitApp

; Define Keybindings:
; Parameters:
;   1. Key: The initial key to be held down (optional).
;   2. Seq: The sequence of keys to be pressed.
;   3. Dur: The duration to sleep between each key press/release.
; Each line defines a keybinding using the Combo function.
; https://www.autohotkey.com/docs/KeyList.htm has a list of keys you can use
Numpad0::Combo("LControl", "Down,Down,Down,Up,Up,Right", 35)
Numpad1::Combo("", "Up,Up,Down,Down,Right,Right,Left,Left,Up,Up,Right,Right", 25)
