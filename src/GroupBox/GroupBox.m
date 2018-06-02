#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSBox* groupBox1;
  NSBox* groupBox2;
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

  groupBox1 = [[NSBox alloc] initWithFrame:NSMakeRect(10, 10, 305, 460)];
  [groupBox1 setTitle:@"GroupBox 1"];
  
  groupBox2 = [[NSBox alloc] initWithFrame:NSMakeRect(325, 10, 305, 460)];
  [groupBox2 setTitle:@""];

  [super initWithContentRect:NSMakeRect(100, 100, 640, 480) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"GroupBox example"];
  [[self contentView] addSubview:groupBox1];
  [[self contentView] addSubview:groupBox2];
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
