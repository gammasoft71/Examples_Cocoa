cmake_minimum_required(VERSION 3.20)

project(Events)
find_library(COCOA_LIBRARY Cocoa)

add_subdirectory(ApplicationIdle)
add_subdirectory(Drawing)
add_subdirectory(WindowAndMessages)
