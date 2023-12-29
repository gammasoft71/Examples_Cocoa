cmake_minimum_required(VERSION 3.20)

project(src)
find_library(COCOA_LIBRARY Cocoa)

add_subdirectory(HelloWorlds)
add_subdirectory(Applications)
add_subdirectory(Dialogs)
add_subdirectory(MenusAndToolbars)
add_subdirectory(Containers)
add_subdirectory(Controls)
add_subdirectory(Components)
add_subdirectory(Events)
add_subdirectory(Others)
