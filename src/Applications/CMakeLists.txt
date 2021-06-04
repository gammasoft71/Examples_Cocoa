cmake_minimum_required(VERSION 3.1)

project(Applications)
find_library(COCOA_LIBRARY Cocoa)

add_subdirectory(Application)
add_subdirectory(ApplicationWithMessageLoop)
