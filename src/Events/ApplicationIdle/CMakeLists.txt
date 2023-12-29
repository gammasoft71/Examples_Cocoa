cmake_minimum_required(VERSION 3.20)

# Project
Project(ApplicationIdle)
find_library(COCOA_LIBRARY Cocoa)

# Options
set(MACOSX_BUNDLE_BUNDLE_VERSION 1.0.0)
set(MACOSX_BUNDLE_COPYRIGHT "© 2020 by Gammasoft")
set(MACOSX_BUNDLE_INFO_STRING "This example shows how to use Cocoa Application with Idle event")
set(MACOSX_BUNDLE_GUI_IDENTIFIER "org.gammasoft.CocoaExemples.ApplicationIdle")

# Application
add_executable(${PROJECT_NAME} MACOSX_BUNDLE ApplicationIdle.m)
target_link_libraries(${PROJECT_NAME} ${COCOA_LIBRARY})
set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER "Events")
