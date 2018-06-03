cmake_minimum_required(VERSION 3.2)
project(CocoaExamples)

# Hzllo World
add_subdirectory("src/HelloWorld")

# Application and messages
add_subdirectory("src/Application")
add_subdirectory("src/ApplicationWithMessageLoop")

# Common Controls
add_subdirectory("src/Button")
add_subdirectory("src/CheckBox")
add_subdirectory("src/Label")
add_subdirectory("src/ProgressBar")
add_subdirectory("src/RadioButton")
add_subdirectory("src/TextBox")
add_subdirectory("src/TrackBar")

# Containers
add_subdirectory("src/ColoredTabPages")
add_subdirectory("src/Form")
add_subdirectory("src/Panel")
add_subdirectory("src/GroupBox")
add_subdirectory("src/TabControl")

# Menus and Toolbars
add_subdirectory("src/MainMenu")

# Components
add_subdirectory("src/Timer")

# Dialogs
add_subdirectory("src/ColorDialog")
add_subdirectory("src/MessageBox")

# Other
add_subdirectory("src/Drawing")
