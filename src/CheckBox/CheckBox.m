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
  
  NSMenu* viewMenu = [[[NSMenu alloc] initWithTitle:NSLocalizedString(@"View" , nil)] autorelease];
  NSMenuItem* viewMenuItem = [[[NSMenuItem alloc] init] autorelease];
  [viewMenuItem setSubmenu:viewMenu];
  
  NSMenu* windowMenu = [[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Window" , nil)] autorelease];
  NSMenuItem* windowMenuItem = [[[NSMenuItem alloc] init] autorelease];
  [windowMenuItem setSubmenu:windowMenu];
  
  NSMenu* helpMenu = [[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Help" , nil)] autorelease];
  NSMenuItem* helpMenuItem = [[[NSMenuItem alloc] init] autorelease];
  [helpMenuItem setSubmenu:helpMenu];
  
  NSMenu* mainMenu = [[[NSMenu alloc] init] autorelease];
  [mainMenu addItem:applicationMenuItem];
  [mainMenu addItem:viewMenuItem];
  [mainMenu addItem:windowMenuItem];
  [mainMenu addItem:helpMenuItem];
  
  [NSApp setMainMenu:mainMenu];
  [NSApp setServicesMenu:servicesMenu];
  [NSApp setWindowsMenu:windowMenu];
  [NSApp setHelpMenu:helpMenu];
  
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
