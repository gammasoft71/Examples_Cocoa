
# Container Examples

This [folder](.) contains [AppKit](https://developer.apple.com/documentation/appkit/) container examples.

* [GroupBox](GroupBox/README.md) shows how to create a GroupBox with [NSBox](https://developer.apple.com/documentation/appkit/nsbox/).
* [Panel](Panel/README.md) shows how to create a Panel with [NSScrollView](https://developer.apple.com/documentation/appkit/nsscrollview/).
* [TabControl](TabControl/README.md) shows how to create a TabControl with TabPages with [NSTabView](https://developer.apple.com/documentation/appkit/nstabview/) and [NSTabViewItem](https://developer.apple.com/documentation/appkit/nstabviewitem/).
* [Window](Window/README.md) shows how to create a Window with [NSWndow](https://developer.apple.com/documentation/appkit/nswindow/).

## Generate and build

To build this project, open "Terminal", go to your project folder and type following lines:

``` cmake
mkdir build
cd build
cmake .. -G "Xcode"
open ./Containers.xcodeproj
```
