cmake_minimum_required(VERSION 3.20)

project(src)
find_library(COCOA_LIBRARY Cocoa)

add_subdirectory(HelloWorlds)
add_subdirectory(Applications)
add_subdirectory(Controls)
add_subdirectory(ControlContainers)
add_subdirectory(MenusAndToolbars)
add_subdirectory(Components)
add_subdirectory(CommonDialogs)
add_subdirectory(Events)
add_subdirectory(Others)
