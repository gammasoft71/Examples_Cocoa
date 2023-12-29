
# Cocoa Examples

Shows how to use macOS [AppKit](https://developer.apple.com/documentation/appkit/) Cocoa controls without StoryBoard only by programming code (objective-c).

[![coocoa](../docs/Pictures/cocoa_header.png)](https://gammasoft71.wixsite.com/gammasoft/cocoa)

## [Hello Worlds](HelloWorlds)

* ["Hello World"](HelloWorlds/HelloWorld/README.md) The classic first application HelloWorld with [NSTextField](https://developer.apple.com/documentation/appkit/nstextfield/).

## [Applications](Applications/README.md)

* [Application](Applications/Application/README.md) shows how to create an Application with [NSApplication](https://developer.apple.com/documentation/appkit/nsapplication/).
* [ApplicationWithMessageLoop](Applications/ApplicationWithMessageLoop/README.md) shows how to create your own message loop and dispatcher with [NSEvent](https://developer.apple.com/documentation/appkit/nsevent/).

## [Menus and toolbars](MenusAndTooolbars)

* [MainMenu](MenusAndToolbars/MainMenu/README.md) shows how to create a MainMenu with [NSMenu](https://developer.apple.com/documentation/appkit/nsmenu/) and [NSMenuItem](https://developer.apple.com/documentation/appkit/nsmenuitem/).

## [Dialogs](Dialogs)

* [ColorDialog](Dialogs/ColorDialog/README.md) shows how to create a ColorDialog with [NSColorPanel](https://developer.apple.com/documentation/appkit/nscolorpanel/).
* [FolderBrowserDialog](Dialogs/FolderBrowserDialog/README.md) shows how to create a FolderBrowserDialog with [NSOpenPanel](https://developer.apple.com/documentation/appkit/nsopenpanel/).
* [FontDialog](Dialogs/FontDialog/README.md) shows how to create a FontDialog with [NSFontPanel](https://developer.apple.com/documentation/appkit/nsfontpanel/).
* [OpenFileDialog](Dialogs/OpenFileDialog/README.md) shows how to create an OpenFileDialog with [NSOpenPanel](https://developer.apple.com/documentation/appkit/nsopenpanel/).
* [MessageBox](Dialogs/MessageBox/README.md) shows how to create a MessageBox with [NSAlert](https://developer.apple.com/documentation/appkit/nsalert/).
* [SaveFileDialog](Dialogs/SaveFileDialog/README.md) shows how to create an SaveFileDialog with [NSSavePanel](https://developer.apple.com/documentation/appkit/nssavepanel/).

## [Containers](Containers)

* [GroupBox](Containers/GroupBox/README.md) shows how to create a GroupBox with [NSBox](https://developer.apple.com/documentation/appkit/nsbox/).
* [Panel](Containers/Panel/README.md) shows how to create a Panel with [NSScrollView](https://developer.apple.com/documentation/appkit/nsscrollview/).
* [TabControl](Containers/TabControl/README.md) shows how to create a TabControl with TabPages with [NSTabView](https://developer.apple.com/documentation/appkit/nstabview/) and [NSTabViewItem](https://developer.apple.com/documentation/appkit/nstabviewitem/).
* [Window](Containers/Window/README.md) shows how to create a Window with [NSWndow](https://developer.apple.com/documentation/appkit/nswindow/).

## [Controls](Controls)

* [Button](Controls/Button/README.md) shows how to create a Button and Event Click with [NSButton](https://developer.apple.com/documentation/appkit/nsbutton/).
* [CheckBox](Controls/CheckBox/README.md) shows how to create a CheckBox with [NSButton](https://developer.apple.com/documentation/appkit/nsbutton/).
* [ComboBox](Controls/ComboBox/README.md) shows how to create a ComboBox with [NSComboBox](https://developer.apple.com/documentation/appkit/nscombobox/).
* [Label](Controls/Label/README.md) shows how to create a Label with [NSTextField](https://developer.apple.com/documentation/appkit/nstextfield/).
* [LevelIndicator](Controls/LevelIndicator/README.md) shows how to create a LevelIndicator with [NSLevelIndicator](https://developer.apple.com/documentation/appkit/nslevelindicator/).
* [ListBox](Controls/ListBox/README.md) shows how to create a ListBox with [NSTextList](https://developer.apple.com/documentation/uikit/nstextlist/).
* [LoadingIndicator](Controls/LoadingIndicator/README.md) shows how to create a LoadingIndicator with [NSProgressIndicator](https://developer.apple.com/documentation/appkit/nsprogressindicator/).
* [PictureBox](Controls/PictureBox/README.md) shows how to create a PictureBox with [NSImageView](https://developer.apple.com/documentation/appkit/nsimageview/).
* [ProgressIndicator](Controls/ProgressIndicator/README.md) shows how to create a ProgressIndicator with [NSProgressIndicator](https://developer.apple.com/documentation/appkit/nsprogressindicator/).
* [RadioButton](Controls/RadioButton/README.md) shows how to create a RadioButton with [NSButton](https://developer.apple.com/documentation/appkit/nsbutton/).
* [Slider](Controls/Slider/README.md) shows how to create a Slider with [NSSlider](https://developer.apple.com/documentation/appkit/nsslider/).
* [SwitchButton](Controls/SwitchButton/README.md) shows how to create a SwitchButton with [NSSwitch](https://developer.apple.com/documentation/appkit/nsswitch/).
* [TextBox](Controls/TextBox/README.md) shows how to create a TextBox with [NSTextField](https://developer.apple.com/documentation/appkit/nstextfield/).
* [ToggleButton](Controls/ToggleButton/README.md) shows how to create a ToggleButton with [NSButton](https://developer.apple.com/documentation/appkit/nsbutton/).
* [TrackBar](Controls/TrackBar/README.md) shows how to create a TrackBar with [NSSlider](https://developer.apple.com/documentation/appkit/nsslider/).

## [Components](Components)

* [Timer](Components/Timer/README.md) shows how to create a Timer with [NSTimer](https://developer.apple.com/documentation/foundation/nstimer/).

## [Events](Events)

* [ApplicationIdle](Events/ApplicationIdle/README.md) shows how to create an idle event.
* [WindowAndMessages](Events/WindowAndMessages/README.md) demonstrates some events received by [NSWndow](https://developer.apple.com/documentation/appkit/nswindow/).

## [Others](Others)

* [ColoredTabPages](Others/ColoredTabPages/README.md) shows how to create a TabControl with colored TabPages with [NSTabView](https://developer.apple.com/documentation/appkit/nstabview/), [NSTabViewItem](https://developer.apple.com/documentation/appkit/nstabviewitem/) and [NSColor](https://developer.apple.com/documentation/appkit/nscolor/).

## Generate and build

To build this project, open "Terminal", go to your project folder and type following lines:

``` cmake
mkdir build
cd build
cmake .. -G "Xcode"
open ./src.xcodeproj
```
