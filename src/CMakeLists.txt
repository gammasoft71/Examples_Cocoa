cmake_minimum_required(VERSION 3.1)

project(src)

# Hello World
add_subdirectory(HelloWorld)

# Application and messages
add_subdirectory(Application)
add_subdirectory(ApplicationIdle)
add_subdirectory(ApplicationWithMessageLoop)

# Common Controls
add_subdirectory(Button)
add_subdirectory(CheckBox)
add_subdirectory(ComboBox)
add_subdirectory(Label)
add_subdirectory(ListBox)
add_subdirectory(PictureBox)
add_subdirectory(ProgressBar)
add_subdirectory(RadioButton)
add_subdirectory(SwitchButton)
add_subdirectory(TextBox)
add_subdirectory(ToggleButton)
add_subdirectory(TrackBar)

# Containers
add_subdirectory(ColoredTabPages)
add_subdirectory(Window)
add_subdirectory(GroupBox)
add_subdirectory(Panel)
add_subdirectory(TabControl)

# Menus and Toolbars
add_subdirectory(MainMenu)

# Components
add_subdirectory(Timer)

# Dialogs
add_subdirectory(ColorDialog)
add_subdirectory(FolderBrowserDialog)
add_subdirectory(FontDialog)
add_subdirectory(OpenFileDialog)
add_subdirectory(MessageBox)
add_subdirectory(SaveFileDialog)

# Other
add_subdirectory(Drawing)
add_subdirectory(WindowAndMessages)
