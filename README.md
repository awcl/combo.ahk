# AutoHotkey Combo Script

This AutoHotkey script, named Combo.ahk, allows you to define custom keybindings for executing sequences of key presses. It is particularly useful for automating repetitive tasks or executing complex keyboard shortcuts with a single keystroke.

## Features

- Define custom keybindings for executing sequences of key presses.
- Supports specifying the initial key to be held down, the sequence of keys to be pressed, and the duration between each key press/release.
- Ability to cancel ongoing actions by triggering a new keybinding or by pressing a specific key.

## Usage

1. Install [AutoHotkey](https://www.autohotkey.com/) if you haven't already.
2. Download or copy the [combo.ahk](combo.ahk) script file.
3. Double-click your new .ahk script file to run it.
4. Use the defined keybindings to execute sequences of key presses. You can customize the keybindings, sequences, and sleep durations between keystrokes by editing the script file [combo.ahk](combo.ahk) with a text editor. See below for the last two lines of the script, which are included in the script to help you get started in defining your own hotkeys using the [AutoHotkey Key List](https://www.autohotkey.com/docs/KeyList.htm)

```ahk
	Numpad0::Combo("LControl", "Down,Down,Down,Up,Up,Right", 35)
	Numpad1::Combo("", "Up,Up,Down,Down,Right,Right,Left,Left,Up,Up,Right,Right", 25)
```

## Customization

You can customize the keybindings, sequences, and durations by editing [combo.ahk](combo.ahk) with any text editor, such as [Notepad++](https://notepad-plus-plus.org/). Follow the existing format and comments to define your own keybindings.

## License

This project is licensed under the BSD 3-Clause License. See the [LICENSE](LICENSE) file for details.
