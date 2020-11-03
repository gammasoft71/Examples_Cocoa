
# Cocoa Examples

Shows how to use macOS AppKit Cocoa controls without StoryBoard only by programming code (objective-c).

## Hello World

["Hello World"](src/HelloWorld/README.md) The classic first application HelloWorld with NSTextField.

## Application and messages

[Application](src/Application/README.md) Shows how to create an Application with NSApplication.

[Application with message loop](src/ApplicationWithMessageLoop/README.md) Shows how to create your own message loop and dispatcher with NSEvent.

## Common Controls

[Button](src/Button/README.md) Shows how to create a Button and Event Click with NSButton.

[CheckBox](src/CheckBox/README.md) Shows how to create a CheckBox with NSButton.

[ComboBox](src/ComboBox/README.md) Shows how to create a ComboBox with NSComboBox.

[Label](src/Label/README.md) Shows how to create a Label with NSTextField.

[PictureBox](src/PictureBox/README.md) Shows how to create a PictureBox with NSImageView.

[ProgressBar](src/ProgressBar/README.md) Shows how to create a ProgressBar with NSProgressIndicator.

[RadioButton](src/RadioButton/README.md) Shows how to create a RadioButton with NSButton.

[SwitchButton](src/SwitchButton/README.md) Shows how to create a SwitchButton with NSSwitch.

[ToggleButton](src/ToggleButton/README.md) Shows how to create a ToggleButton with NSButton.

[TextBox](src/TextBox/README.md) Shows how to create a TextBox with NSTextField.

[TrackBar](src/TrackBar/README.md) Shows how to create a TrackBar with NSSlider.

## Containers

[Form](src/Form/README.md) Shows how to create a Form with NSWndow.

[GroupBox](src/GroupBox/README.md) Shows how to create a GroupBox with NSBox.

[Panel](src/Panel/README.md) Shows how to create a Panel with NSScrollView.

[TabControl](src/TabControl/README.md) Shows how to create a TabControl with TabPages with NSTabView and NSTabViewItem.

## Menus and toolbars

[MainMenu](src/MainMenu/README.md) Shows how to create a MainMenu with NSMenu and NSMenuItem.

## Components

[Timer](src/Timer/README.md) Shows how to create a Timer with NSTimer.

## Dialogs

[ColorDialog](src/ColorDialog/README.md) Shows how to create a ColorDialog with NSColorPanel.

[FolderBrowserDialog](src/FolderBrowserDialog/README.md) Shows how to create a FolderBrowserDialog with NSOpenPanel.

[FontDialog](src/FontDialog/README.md) Shows how to create a FontDialog with NSFontPanel.

[OpenFileDialog](src/OpenFileDialog/README.md) Shows how to create an OpenFileDialog with NSOpenPanel.

[MessageBox](src/MessageBox/README.md) Shows how to create a MessageBox with NSAlert.

[SaveFileDialog](src/SaveFileDialog/README.md) Shows how to create an SaveFileDialog with NSSavePanel.

## Other

[ColoredTabPages](src/ColoredTabPages/README.md) Shows how to create a TabControl with colored TabPages with NSTabView, NSTabViewItem and NSColor.

## Download

``` shell
git clone https://github.com/gammasoft71/CocoaExamples CocoaExamples

```

## Generate and build

To build this project, open "Terminal", go to your project folder and type following lines:

``` cmake
mkdir build
cd build
cmake .. -G "Xcode"
open ./CocoaExamples.xcodeproj
```


## Remarks

This project run only on macOS with [Xcode](https://developer.apple.com/xcode) and [CMake](https://cmake.org).
