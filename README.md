
# Cocoa Examples

Shows how to use macOS AppKit Cocoa controls without StoryBoard only by programming code (objective-c).

## Hello, World!

["Hello, World!"](Form/Form.m) The classic first application HelloWorld, with NSTextField.

## Application and messages

[Application](Application/Application.m) Shows how to create a simple Cocoa application with NSApplication.

[Application with message loop](ApplicationWithMessageLoop/ApplicationWithMessageLoop.m) Shows how to create your own message loop and dispatcher with NSEvent.

## Containers

[Form](Form/Form.m) Shows how to create a simple Cocoa Form with NSWndow.

[TabControl and TabPages](TabControl/TabControl.m) Shows how to create a simple Cocoa TabControl with TabPages with NSTabView and NSTabViewItem.

## Common Controls

[Button](Button/Button.m) Shows how to create a Cocoa Button and Event Click with NSButton.

[CheckBox](Button/CheckBox.m) Shows how to create a Cocoa CheckBox and Event Click with NSButton.

[Label](Form/Form.m) Shows how to create a Cocoa Label with NSTextField.

## Download

``` shell
git clone https://github.com/gammasoft71/CocoaExamples CocoaExamples

```

## Generate and build

To build this project, open "Terminal" and type following lines:

``` cmake
mkdir build
cd build
cmake .. -G "Xcode"
open ./CocoaExamples.xcodeproj
```

## Remarks

This project run only on macOS with [Xcode](https://developer.apple.com/xcode) and [CMake](https://cmake.org).
