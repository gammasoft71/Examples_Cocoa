#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSButton* button1;
  NSButton* button2;
  NSTextField* label1;
  NSTextField* label2;
  int button1Clicked;
  int button2Clicked;
}

- (instancetype) init;
- (BOOL)windowShouldClose:(id)sender;
- (IBAction) OnButton1Click:(id)sender;
- (IBAction) OnButton2Click:(id)sender;
@end

@implementation Form
- (instancetype) init {
  button1Clicked = 0;
  button2Clicked = 0;

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

  button1 = [[[NSButton alloc] initWithFrame:NSMakeRect(50, 220, 90, 32)] autorelease];
  [button1 setTitle:@"button1"];
  [button1 setBezelStyle:NSBezelStyleRounded];
  [button1 setTarget:self];
  [button1 setAction:@selector(OnButton1Click:)];
  [button1 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  button2 = [[[NSButton alloc] initWithFrame:NSMakeRect(50, 125, 200, 75)] autorelease];
  [button2 setTitle:@"button2"];
  [button2 setBezelStyle:NSSmallSquareBezelStyle];
  [button2 setTarget:self];
  [button2 setAction:@selector(OnButton2Click:)];
  [button2 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  
  label1 = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 80, 150, 20)];
  [label1 setStringValue:@"button1 clicked 0 times"];
  [label1 setBezeled:NO];
  [label1 setDrawsBackground:NO];
  [label1 setEditable:NO];

  label2 = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 50, 150, 20)];
  [label2 setStringValue:@"button2 clicked 0 times"];
  [label2 setBezeled:NO];
  [label2 setDrawsBackground:NO];
  [label2 setEditable:NO];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Button example"];
  [[self contentView] addSubview:button1];
  [[self contentView] addSubview:button2];
  [[self contentView] addSubview:label1];
  [[self contentView] addSubview:label2];
  [self setIsVisible:YES];

  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}

- (IBAction) OnButton1Click:(id)sender {
  [label1 setStringValue:[NSString stringWithFormat:@"button1 clicked %d times", ++button1Clicked]];
}

- (IBAction) OnButton2Click:(id)sender {
  [label2 setStringValue:[NSString stringWithFormat:@"button1 clicked %d times", ++button2Clicked]];
}
@end

int main(int argc, char* argv[]) {
  // Creates Application
  [NSApplication sharedApplication];
  [[[[Form alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
