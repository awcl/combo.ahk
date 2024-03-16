#NoEnv
SendMode Input

; Define a global variable to track ongoing actions
global ongoingAction

; Define a function for the Combo
Combo(Key, Seq, Dur) {
    ; Cancel ongoing action if exists
    CancelAction(Key, Dur)
    
    ; Set the ongoing action flag
    ongoingAction := Key . Seq . Dur
    
    if (Key != "") {
        SendInput, {%Key% Down}
        Sleep %Dur%
    }
    
    Loop, Parse, Seq
    {
        ; Check if cancellation is requested
        if (ongoingAction != Key . Seq . Dur) {
            ; If cancellation is requested, release the held key and exit the loop
            if (Key != "")
                SendInput, {%Key% Up}
            ; Clear the ongoing action flag
            ongoingAction := ""
            ; Exit the loop
            break
        }
        
        SendInput, {Blind}{%A_LoopField% Down}
        Sleep %Dur%
        SendInput, {Blind}{%A_LoopField% Up}
        Sleep %Dur%
    }
    
    if (Key != "")
        SendInput, {%Key% Up}
    
    ; Clear the ongoing action flag
    ongoingAction := ""
}

; Define a function to cancel the ongoing action
; Parameters:
;   1. Key: The key to release.
;   2. Dur: The duration to sleep between each key press/release.
CancelAction(Key, Dur) {
    if (ongoingAction != "") {
        ; Extract Key, Seq, and Dur from the ongoingAction string
        Seq := ""
        
        ; Release the held key
        if (Key != "")
            SendInput, {%Key% Up}
        
        ; Clear the ongoing action flag
        ongoingAction := ""
    }
}

; Define Keybindings:
; Parameters:
;   1. Key: The initial key to be held down (optional).
;   2. Seq: The sequence of keys to be pressed.
;   3. Dur: The duration to sleep between each key press/release.
; Each line defines a keybinding using the Combo function.
; https://www.autohotkey.com/docs/KeyList.htm has a list of keys you can use
Numpad0::Combo("LControl", "Down,Down,Down,Up,Up,Right", 35)
Numpad1::Combo("", "Up,Up,Down,Down,Right,Right,Left,Left,Up,Up,Right,Right", 25)