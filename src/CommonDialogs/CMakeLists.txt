cmake_minimum_required(VERSION 3.1)

project(CommonDialogs)
find_library(COCOA_LIBRARY Cocoa)

add_subdirectory(ColorDialog)
add_subdirectory(FolderBrowserDialog)
add_subdirectory(FontDialog)
add_subdirectory(OpenFileDialog)
add_subdirectory(MessageBox)
add_subdirectory(SaveFileDialog)
