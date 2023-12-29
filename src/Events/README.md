
# Event Examples

This [folder](.) contains [AppKit](https://developer.apple.com/documentation/appkit/) event examples.

* [ApplicationIdle](ApplicationIdle/README.md) shows how to create an idle event.
* [WindowAndMessages](WindowAndMessages/README.md) demonstrates some events received by [NSWndow](https://developer.apple.com/documentation/appkit/nswindow/).

## Generate and build

To build this project, open "Terminal", go to your project folder and type following lines:

``` cmake
mkdir build
cd build
cmake .. -G "Xcode"
open ./Events.xcodeproj
```
