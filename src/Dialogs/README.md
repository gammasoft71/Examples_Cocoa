
# Dialog Examples

This [folder](.) contains [AppKit](https://developer.apple.com/documentation/appkit/) dialog examples.

* [ColorDialog](ColorDialog/README.md) shows how to create a ColorDialog with [NSColorPanel](https://developer.apple.com/documentation/appkit/nscolorpanel/).
* [FolderBrowserDialog](FolderBrowserDialog/README.md) shows how to create a FolderBrowserDialog with [NSOpenPanel](https://developer.apple.com/documentation/appkit/nsopenpanel/).
* [FontDialog](FontDialog/README.md) shows how to create a FontDialog with [NSFontPanel](https://developer.apple.com/documentation/appkit/nsfontpanel/).
* [OpenFileDialog](OpenFileDialog/README.md) shows how to create an OpenFileDialog with [NSOpenPanel](https://developer.apple.com/documentation/appkit/nsopenpanel/).
* [MessageBox](MessageBox/README.md) shows how to create a MessageBox with [NSAlert](https://developer.apple.com/documentation/appkit/nsalert/).
* [SaveFileDialog](SaveFileDialog/README.md) shows how to create an SaveFileDialog with [NSSavePanel](https://developer.apple.com/documentation/appkit/nssavepanel/).

## Generate and build

To build this project, open "Terminal", go to your project folder and type following lines:

``` cmake
mkdir build
cd build
cmake .. -G "Xcode"
open ./Dialogs.xcodeproj
```
