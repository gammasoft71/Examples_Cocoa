Project(PictureBox VERSION 1.0.0)

set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
set(MACOSX_BUNDLE_COPYRIGHT "© 2018 by Gammasoft")
set(MACOSX_BUNDLE_INFO_STRING "This example shows how to use Cocoa PictureBox")
set(MACOSX_BUNDLE_GUI_IDENTIFIER "org.gammasoft.CocoaExamples.PictureBox")
set_source_files_properties(Resources/Logo.png PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

add_executable(PictureBox MACOSX_BUNDLE Resources/Logo.png PictureBox.m)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -framework Cocoa")
