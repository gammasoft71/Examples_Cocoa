cmake_minimum_required(VERSION 3.20)

# Project
Project(LevelIndicator VERSION 1.0.0)
find_library(COCOA_LIBRARY Cocoa)

# Options
set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
set(MACOSX_BUNDLE_COPYRIGHT "© 2023 by Gammasoft")
set(MACOSX_BUNDLE_INFO_STRING "This example shows how to use Cocoa LevelIndicator")
#set(MACOSX_BUNDLE_GUI_IDENTIFIER "org.gammasoft.CocoaExamples.LevelIndicator")

# Application
add_executable(${PROJECT_NAME} MACOSX_BUNDLE LevelIndicator.m)
target_link_libraries(${PROJECT_NAME} ${COCOA_LIBRARY})
set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER "Controls")
