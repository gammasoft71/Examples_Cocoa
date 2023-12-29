
# Cocoa Examples

Shows how to use macOS AppKit Cocoa controls without StoryBoard only by programming code (objective-c).

[![coocoa](docs/Pictures/cocoa_header.png)](https://gammasoft71.wixsite.com/gammasoft/cocoa)

## [Hello Worlds](src/HelloWorlds)

* ["Hello World"](src/HelloWorlds/HelloWorld/README.md) The classic first application HelloWorld with [NSTextField](https://developer.apple.com/documentation/appkit/nstextfield/).

## [Applications](src/Applications)

* [Application](src/Applications/Application/README.md) shows how to create an Application with [NSApplication](https://developer.apple.com/documentation/appkit/nsapplication/).
* [ApplicationWithMessageLoop](src/Applications/ApplicationWithMessageLoop/README.md) shows how to create your own message loop and dispatcher with [NSEvent](https://developer.apple.com/documentation/appkit/nsevent/).

## [Menus and toolbars](src/MenusAndTooolbars)

* [MainMenu](src/MenusAndToolbars/MainMenu/README.md) shows how to create a MainMenu with [NSMenu](https://developer.apple.com/documentation/appkit/nsmenu/) and [NSMenuItem](https://developer.apple.com/documentation/appkit/nsmenuitem/).

## [Dialogs](src/Dialogs)

* [ColorDialog](src/Dialogs/ColorDialog/README.md) shows how to create a ColorDialog with [NSColorPanel](https://developer.apple.com/documentation/appkit/nscolorpanel/).
* [FolderBrowserDialog](src/Dialogs/FolderBrowserDialog/README.md) shows how to create a FolderBrowserDialog with [NSOpenPanel](https://developer.apple.com/documentation/appkit/nsopenpanel/).
* [FontDialog](src/Dialogs/FontDialog/README.md) shows how to create a FontDialog with [NSFontPanel](https://developer.apple.com/documentation/appkit/nsfontpanel/).
* [OpenFileDialog](src/Dialogs/OpenFileDialog/README.md) shows how to create an OpenFileDialog with [NSOpenPanel](https://developer.apple.com/documentation/appkit/nsopenpanel/).
* [MessageBox](src/Dialogs/MessageBox/README.md) shows how to create a MessageBox with [NSAlert](https://developer.apple.com/documentation/appkit/nsalert/).
* [SaveFileDialog](src/Dialogs/SaveFileDialog/README.md) shows how to create an SaveFileDialog with [NSSavePanel](https://developer.apple.com/documentation/appkit/nssavepanel/).

## [Containers](src/Containers)

* [GroupBox](src/Containers/GroupBox/README.md) shows how to create a GroupBox with NSBox.
* [Panel](src/Containers/Panel/README.md) shows how to create a Panel with NSScrollView.
* [TabControl](src/Containers/TabControl/README.md) shows how to create a TabControl with TabPages with NSTabView and NSTabViewItem.
* [Window](src/Containers/Window/README.md) shows how to create a Window with NSWndow.

## [Controls](src/Controls)

* [Button](src/Controls/Button/README.md) shows how to create a Button and Event Click with NSButton.
* [CheckBox](src/Controls/CheckBox/README.md) shows how to create a CheckBox with NSButton.
* [ComboBox](src/Controls/ComboBox/README.md) shows how to create a ComboBox with NSComboBox.
* [Label](src/Controls/Label/README.md) shows how to create a Label with NSTextField.
* [LevelIndicator](src/Controls/LevelIndicator/README.md) shows how to create a LevelIndicator with NSLevelIndicator.
* [ListBox](src/Controls/ListBox/README.md) shows how to create a ListBox with NSList.
* [LoadingIndicator](src/Controls/LoadingIndicator/README.md) shows how to create a LoadingIndicator with NSProgressIndicator.
* [PictureBox](src/Controls/PictureBox/README.md) shows how to create a PictureBox with NSImageView.
* [ProgressIndicator](src/Controls/ProgressIndicator/README.md) shows how to create a ProgressIndicator with NSProgressIndicator.
* [RadioButton](src/Controls/RadioButton/README.md) shows how to create a RadioButton with NSButton.
* [Slider](src/Controls/Slider/README.md) shows how to create a Slider with NSSlider.
* [SwitchButton](src/Controls/SwitchButton/README.md) shows how to create a SwitchButton with NSSwitch.
* [TextBox](src/Controls/TextBox/README.md) shows how to create a TextBox with NSTextField.
* [ToggleButton](src/Controls/ToggleButton/README.md) shows how to create a ToggleButton with NSButton.
* [TrackBar](src/Controls/TrackBar/README.md) shows how to create a TrackBar with NSSlider.

## [Components](src/Components)

* [Timer](src/Components/Timer/README.md) shows how to create a Timer with NSTimer.

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
