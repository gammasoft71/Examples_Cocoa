#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSButton* checkBox1;
  NSButton* checkBox2;
  NSButton* checkBox3;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  [NSApp setMainMenu:[[[NSMenu alloc] init] autorelease]];
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][0] setSubmenu:[[[NSMenu alloc] initWithTitle:[[NSProcessInfo processInfo] processName]] autorelease]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"About %@"], nil), [[NSProcessInfo processInfo] processName]] action:@selector(orderFrontStandardAboutPanel:) keyEquivalent:@""] autorelease]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"Services", nil) action:nil keyEquivalent:@""] autorelease]];
  [[[[[NSApp mainMenu] itemArray][0] submenu] itemArray][2] setSubmenu:[[[NSMenu alloc] init] autorelease]];
  [NSApp setServicesMenu:[[[[[NSApp mainMenu] itemArray][0] submenu] itemArray][2] submenu]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"Hide %@"],nil), [[NSProcessInfo processInfo] processName]] action:@selector(hide:) keyEquivalent:@"h"] autorelease]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"Hide Other", nil) action:@selector(hideOtherApplications:) keyEquivalent:@"h"] autorelease]];
  [[[[[NSApp mainMenu] itemArray][0] submenu] itemArray][4] setKeyEquivalentModifierMask:NSEventModifierFlagOption|NSEventModifierFlagCommand];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"Show All", nil) action:@selector(unhideAllApplications:) keyEquivalent:@""] autorelease]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"Quit %@"] , nil), [[NSProcessInfo processInfo] processName]] action:@selector(terminate:) keyEquivalent:@"q"] autorelease]];
  
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][1] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"View" , nil)] autorelease]];
  
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][2] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Window" , nil)] autorelease]];
  [NSApp setWindowsMenu:[[[NSApp mainMenu] itemArray][2] submenu]];
  
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][3] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Help" , nil)] autorelease]];
  [NSApp setHelpMenu:[[[NSApp mainMenu] itemArray][3] submenu]];

  NSButton* checkBox1 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 245, 105, 20)] autorelease];
  [checkBox1 setTitle:@"Checked"];
  [checkBox1 setAllowsMixedState:YES];
  [checkBox1 setButtonType:NSButtonTypeSwitch];
  [checkBox1 setTarget:checkBox1];
  [checkBox1 setAction:@selector(OnClick:)];
  [checkBox1 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox1 setState:NSControlStateValueOn];
  
  NSButton* checkBox2 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 215, 105, 20)] autorelease];
  [checkBox2 setTitle:@"Unchecked"];
  [checkBox2 setAllowsMixedState:YES];
  [checkBox2 setButtonType:NSButtonTypeSwitch];
  [checkBox2 setTarget:checkBox2];
  [checkBox2 setAction:@selector(OnClick:)];
  [checkBox2 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox2 setState:NSControlStateValueOff];
  
  NSButton* checkBox3 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 185, 105, 20)] autorelease];
  [checkBox3 setTitle:@"Indeterminate"];
  [checkBox3 setAllowsMixedState:YES];
  [checkBox3 setButtonType:NSButtonTypeSwitch];
  [checkBox3 setTarget:checkBox3];
  [checkBox3 setAction:@selector(OnClick:)];
  [checkBox3 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox3 setState:NSControlStateValueMixed];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"CheckBox example"];
  [[self contentView] addSubview:checkBox1];
  [[self contentView] addSubview:checkBox2];
  [[self contentView] addSubview:checkBox3];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Form alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
