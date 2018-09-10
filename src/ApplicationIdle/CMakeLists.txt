cmake_minimum_required(VERSION 3.0)
Project(ApplicationWithMessageLoop)
add_executable(ApplicationIdle MACOSX_BUNDLE ApplicationIdle.m)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -framework Cocoa")

set(MACOSX_BUNDLE_BUNDLE_VERSION 1.0.0)
set(MACOSX_BUNDLE_COPYRIGHT "© 2018 by Gammasoft")
set(MACOSX_BUNDLE_INFO_STRING "This example shows how to use Cocoa Application with Idle event")
set(MACOSX_BUNDLE_GUI_IDENTIFIER "org.gammasoft.CocoaExemples.ApplicationIdle")
