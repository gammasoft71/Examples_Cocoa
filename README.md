
# Cocoa Examples

Shows how to use macOS AppKit Cocoa controls without StoryBoard only by programming code (objective-c).

## Hello, World!

["Hello, World!"](src/HelloWorld) The classic first application HelloWorld, with NSTextField.

## Application and messages

[Application](src/Application) Shows how to create a simple Cocoa application with NSApplication.

[Application with message loop](src/ApplicationWithMessageLoop) Shows how to create your own message loop and dispatcher with NSEvent.

## Containers

[Form](src/Form) Shows how to create a simple Cocoa Form with NSWndow.

[TabControl](src/TabControl) Shows how to create a simple Cocoa TabControl with TabPages with NSTabView and NSTabViewItem.

## Common Controls

[Button](src/Button) Shows how to create a Cocoa Button and Event Click with NSButton.

[CheckBox](src/CheckBox) Shows how to create a Cocoa CheckBox and Event Click with NSButton.

[Label](src/Label) Shows how to create a Cocoa Label with NSTextField.

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
