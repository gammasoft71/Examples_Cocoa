cmake_minimum_required(VERSION 3.20)

project(Dialogs)
find_library(COCOA_LIBRARY Cocoa)

add_subdirectory(ColorDialog)
add_subdirectory(FolderBrowserDialog)
add_subdirectory(FontDialog)
add_subdirectory(OpenFileDialog)
add_subdirectory(MessageBox)
add_subdirectory(SaveFileDialog)
