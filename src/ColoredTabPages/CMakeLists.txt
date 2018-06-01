Project(ColoredTabPages VERSION 1.0.0)
add_executable(ColoredTabPages MACOSX_BUNDLE ColoredTabPages.m)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -framework Cocoa")

set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
set(MACOSX_BUNDLE_COPYRIGHT "© 2018 by Gammasoft")
set(MACOSX_BUNDLE_INFO_STRING "This example shows how to use Cocoa tab control and colored tab pages")
set(MACOSX_BUNDLE_GUI_IDENTIFIER "org.gammasoft.CocoaExamples.ColoredTabPages")
