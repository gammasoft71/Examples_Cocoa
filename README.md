
# Cocoa Examples

Shows how to use macOS [AppKit](https://developer.apple.com/documentation/appkit/) Cocoa controls without StoryBoard only by programming code (objective-c).

[![coocoa](docs/Pictures/cocoa_header.png)](https://gammasoft71.wixsite.com/gammasoft/cocoa)

* [Hello Worlds](src/HelloWorlds/README.md) contains AppKit "Hello, World!" examples.
* [Applications](src/Applications/README.md) contains applications examples.
* [Dialogs](src/Dialogs/README.md)contains dialogs examples.
* [Menus and toolbars](src/MenusAndToolbars/README.md) contains menus and toolbars examples.
* [Containers](src/Containers/README.md) contains containers examples.
* [Controls](src/Controls/README.md) contains common controls examples.
* [Components](src/Components/README.md) contains components examples.
* [Events](src/Events/README.md) contains events examples.
* [Others](src/Others/README.md) contains others examples.
* [All](src/README.md) contains all examples.

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
