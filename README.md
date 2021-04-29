
# Cocoa Examples

Shows how to use macOS AppKit Cocoa controls without StoryBoard only by programming code (objective-c).

[![coocoa](docs/Pictures/cocoa_header.png)](https://gammasoft71.wixsite.com/gammasoft/cocoa)

## [Hello Worlds](src/HelloWorlds)

* ["Hello World"](src/HelloWorlds/HelloWorld/README.md) The classic first application HelloWorld with NSTextField.

## [Applications](src/Applications)

* [Application](src/Applications/Application/README.md) shows how to create an Application with NSApplication.
* [ApplicationWithMessageLoop](src/Applications/ApplicationWithMessageLoop/README.md) shows how to create your own message loop and dispatcher with NSEvent.

## [Common Controls](src/CoommonControls)

* [Button](src/CommonControls/Button/README.md) shows how to create a Button and Event Click with NSButton.
* [CheckBox](src/CommonControls/CheckBox/README.md) shows how to create a CheckBox with NSButton.
* [ComboBox](src/CommonControls/ComboBox/README.md) shows how to create a ComboBox with NSComboBox.
* [Label](src/CommonControls/Label/README.md) shows how to create a Label with NSTextField.
* [ListBox](src/CommonControls/ListBoox/README.md) shows how to create a ListBox with NSList.
* [PictureBox](src/CommonControls/PictureBox/README.md) shows how to create a PictureBox with NSImageView.
* [ProgressBar](src/CommonControls/ProgressBar/README.md) shows how to create a ProgressBar with NSProgressIndicator.
* [RadioButton](src/CommonControls/RadioButton/README.md) shows how to create a RadioButton with NSButton.
* [SwitchButton](src/CommonControls/SwitchButton/README.md) shows how to create a SwitchButton with NSSwitch.
* [TextBox](src/CommonControls/TextBox/README.md) shows how to create a TextBox with NSTextField.
* [ToggleButton](src/CommonControls/ToggleButton/README.md) shows how to create a ToggleButton with NSButton.
* [TrackBar](src/CommonControls/TrackBar/README.md) shows how to create a TrackBar with NSSlider.

## [Control Containers](src/ControlContainers)

* [GroupBox](src/ControlContainers/GroupBox/README.md) shows how to create a GroupBox with NSBox.
* [Panel](src/ControlContainers/Panel/README.md) shows how to create a Panel with NSScrollView.
* [TabControl](src/ControlContainers/TabControl/README.md) shows how to create a TabControl with TabPages with NSTabView and NSTabViewItem.
* [Window](src/ControlContainers/Window/README.md) shows how to create a Window with NSWndow.

## [Menus and toolbars](src/MenusAndTooolbars)

* [MainMenu](src/MenusAndTooolbars/MainMenu/README.md) shows how to create a MainMenu with NSMenu and NSMenuItem.

## [Components](src/Components)

* [Timer](src/Components/Timer/README.md) shows how to create a Timer with NSTimer.

## [Common Dialogs](src/CommonDialogs)

* [ColorDialog](src/CommonDialogs/ColorDialog/README.md) shows how to create a ColorDialog with NSColorPanel.
* [FolderBrowserDialog](src/CommonDialogsv/FolderBrowserDialog/README.md) shows how to create a FolderBrowserDialog with NSOpenPanel.
* [FontDialog](src/CommonDialogs/FontDialog/README.md) shows how to create a FontDialog with NSFontPanel.
* [OpenFileDialog](src/CommonDialogs/OpenFileDialog/README.md) shows how to create an OpenFileDialog with NSOpenPanel.
* [MessageBox](src/CommonDialogs/MessageBox/README.md) shows how to create a MessageBox with NSAlert.
* [SaveFileDialog](src/CommonDialogs/SaveFileDialog/README.md) shows how to create an SaveFileDialog with NSSavePanel.

## [Events](src/Events)

* [ApplicationIdle](src/Events/ApplicationIdle/README.md) shows how to create an idle event.
* [WindowAndMessages](src/Events/WindowAndMessages/README.md) demonstrates some events received by NSWindow.

## [Others](src/Others)

* [ColoredTabPages](src/Others/ColoredTabPages/README.md) shows how to create a TabControl with colored TabPages with NSTabView, NSTabViewItem and NSColor.

## Download

``` shell
git clone https://github.com/gammasoft71/Examples_Cocoa Examples_Cocoa
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
