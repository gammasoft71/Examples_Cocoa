Project(ApplicationWithMessageLoop VERSION 1.0.0)
add_executable(ApplicationWithMessageLoop MACOSX_BUNDLE ApplicationWithMessageLoop.m)
set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -framework Cocoa")

set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -framework Cocoa")
set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
set(MACOSX_BUNDLE_COPYRIGHT "© 2018 by Gammasoft")
set(MACOSX_BUNDLE_INFO_STRING "This example shows how to use Cocoa application with message loop")
set(MACOSX_BUNDLE_GUI_IDENTIFIER "org.gammasoft.CocoaExemples.ApplicationWithMessageLoop")
