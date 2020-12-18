cmake_minimum_required(VERSION 3.1)

project(CocoaExamples)

# Hello World
add_subdirectory("src/HelloWorld")

# Application and messages
add_subdirectory(src/Application)
add_subdirectory(src/ApplicationIdle)
add_subdirectory(src/ApplicationWithMessageLoop)

# Common Controls
add_subdirectory(src/Button)
add_subdirectory(src/CheckBox)
add_subdirectory(src/ComboBox)
add_subdirectory(src/Label)
add_subdirectory(src/ListBox)
add_subdirectory(src/PictureBox)
add_subdirectory(src/ProgressBar)
add_subdirectory(src/RadioButton)
add_subdirectory(src/SwitchButton)
add_subdirectory(src/TextBox)
add_subdirectory(src/ToggleButton)
add_subdirectory(src/TrackBar)

# Containers
add_subdirectory(src/ColoredTabPages)
add_subdirectory(src/Window)
add_subdirectory(src/GroupBox)
add_subdirectory(src/Panel)
add_subdirectory(src/TabControl)

# Menus and Toolbars
add_subdirectory(src/MainMenu)

# Components
add_subdirectory(src/Timer)

# Dialogs
add_subdirectory(src/ColorDialog)
add_subdirectory(src/FolderBrowserDialog)
add_subdirectory(src/FontDialog)
add_subdirectory(src/OpenFileDialog)
add_subdirectory(src/MessageBox)
add_subdirectory(src/SaveFileDialog)

# Other
add_subdirectory(src/Drawing)
add_subdirectory(src/WindowAndMessages)
