cmake_minimum_required(VERSION 3.1)

project(ControlContainers)
find_library(COCOA_LIBRARY Cocoa)

add_subdirectory(GroupBox)
add_subdirectory(Panel)
add_subdirectory(TabControl)
add_subdirectory(Window)
