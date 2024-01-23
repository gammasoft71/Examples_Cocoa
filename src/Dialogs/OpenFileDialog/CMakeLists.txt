cmake_minimum_required(VERSION 3.20)

# Project
Project(OpenFileDialog VERSION 1.0.0)
find_library(COCOA_LIBRARY Cocoa)

# Options
set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
set(MACOSX_BUNDLE_COPYRIGHT "© 2020 by Gammasoft")
set(MACOSX_BUNDLE_INFO_STRING "This example shows how to use Cocoa OpenFileDialog")
#set(MACOSX_BUNDLE_GUI_IDENTIFIER "org.gammasoft.CocoaExamples.OpenFileDialog")

# Application
add_executable(${PROJECT_NAME} MACOSX_BUNDLE OpenFileDialog.m)
target_link_libraries(${PROJECT_NAME} ${COCOA_LIBRARY})
set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER "Dialogs")
