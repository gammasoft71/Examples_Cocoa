
# Application Examples

This [folder](.) contains [AppKit](https://developer.apple.com/documentation/appkit/) application examples.

* [Application](Application/README.md) shows how to create an Application with [NSApplication](https://developer.apple.com/documentation/appkit/nsapplication/).
* [ApplicationWithMessageLoop](ApplicationWithMessageLoop/README.md) shows how to create your own message loop and dispatcher with [NSEvent](https://developer.apple.com/documentation/appkit/nsevent/).

## Generate and build

To build this project, open "Terminal", go to your project folder and type following lines:

``` cmake
mkdir build
cd build
cmake .. -G "Xcode"
open ./Applications.xcodeproj
```
