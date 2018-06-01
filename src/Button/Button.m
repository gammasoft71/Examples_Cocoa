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

  // Creates Application submenu with process name
  NSMenu* applicationMenu = [[[NSMenu alloc] init] autorelease];
  [applicationMenu addItem:[[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"About %@"] , nil), [[NSProcessInfo processInfo] processName]] action:@selector(orderFrontStandardAboutPanel:) keyEquivalent:@""] autorelease]];
  [applicationMenu addItem:[NSMenuItem separatorItem]];
  NSMenuItem* servicesMenuItem = [applicationMenu addItemWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Services"], nil) action:nil keyEquivalent:@""];
  NSMenu* servicesMenu = [[[NSMenu alloc] initWithTitle:@""] autorelease];
  [applicationMenu setSubmenu:servicesMenu forItem:servicesMenuItem];
  [applicationMenu addItem:[NSMenuItem separatorItem]];
  [applicationMenu addItemWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"Hide %@"],nil), [[NSProcessInfo processInfo] processName]] action:@selector(hide:) keyEquivalent:@"h"];
  NSMenuItem* hideOtherMenuItem = [applicationMenu addItemWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Hide Others"] , nil) action:@selector(hideOtherApplications:) keyEquivalent:@"h"];
  [hideOtherMenuItem setKeyEquivalentModifierMask:(NSEventModifierFlagOption|NSEventModifierFlagCommand)];
  [applicationMenu addItemWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Show All"] , nil) action:@selector(unhideAllApplications:) keyEquivalent:@""];
  [applicationMenu addItem:[NSMenuItem separatorItem]];
  [applicationMenu addItem:[[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"Quit %@"] , nil), [[NSProcessInfo processInfo] processName]] action:@selector(terminate:) keyEquivalent:@"q"] autorelease]];
  NSMenuItem* applicationMenuItem = [[[NSMenuItem alloc] init] autorelease];
  [applicationMenuItem setSubmenu:applicationMenu];

  // Creates View submenu
  NSMenu* viewMenu = [[[NSMenu alloc] initWithTitle:NSLocalizedString(@"View" , nil)] autorelease];
  NSMenuItem* viewMenuItem = [[[NSMenuItem alloc] init] autorelease];
  [viewMenuItem setSubmenu:viewMenu];
  
  // Creates Window submenu
  NSMenu* windowMenu = [[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Window" , nil)] autorelease];
  NSMenuItem* windowMenuItem = [[[NSMenuItem alloc] init] autorelease];
  [windowMenuItem setSubmenu:windowMenu];
  
  // Creates Help submenu
  NSMenu* helpMenu = [[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Help" , nil)] autorelease];
  NSMenuItem* helpMenuItem = [[[NSMenuItem alloc] init] autorelease];
  [helpMenuItem setSubmenu:helpMenu];
  
  // Creates main menubar
  NSMenu* mainMenu = [[[NSMenu alloc] init] autorelease];
  [mainMenu addItem:applicationMenuItem];
  [mainMenu addItem:viewMenuItem];
  [mainMenu addItem:windowMenuItem];
  [mainMenu addItem:helpMenuItem];

  [NSApp setMainMenu:mainMenu];
  [NSApp setServicesMenu:servicesMenu];
  [NSApp setWindowsMenu:windowMenu];
  [NSApp setHelpMenu:helpMenu];

  // Create button1
  button1 = [[[NSButton alloc] initWithFrame:NSMakeRect(50, 220, 90, 32)] autorelease];
  [button1 setTitle:@"button1"];
  [button1 setBezelStyle:NSBezelStyleRounded];
  [button1 setTarget:self];
  [button1 setAction:@selector(OnButton1Click:)];
  [button1 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  // Create button1
  button2 = [[[NSButton alloc] initWithFrame:NSMakeRect(50, 125, 200, 75)] autorelease];
  [button2 setTitle:@"button2"];
  [button2 setBezelStyle:NSSmallSquareBezelStyle];
  [button2 setTarget:self];
  [button2 setAction:@selector(OnButton2Click:)];
  [button2 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  
  // Create label1
  label1 = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 80, 150, 20)];
  [label1 setStringValue:@"button1 clicked 0 times"];
  [label1 setBezeled:NO];
  [label1 setDrawsBackground:NO];
  [label1 setEditable:NO];

  // Create label2
  label2 = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 50, 150, 20)];
  [label2 setStringValue:@"button2 clicked 0 times"];
  [label2 setBezeled:NO];
  [label2 setDrawsBackground:NO];
  [label2 setEditable:NO];

  // Create Form
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
