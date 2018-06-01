#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSButton* button;
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

  button = [[[NSButton alloc] initWithFrame:NSMakeRect(10, 443, 90, 32)] autorelease];
  [button setTitle:@"Close"];
  [button setBezelStyle:NSBezelStyleRounded];
  [button setTarget:self];
  [button setAction:@selector(windowShouldClose:)];
  [button setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  [super initWithContentRect:NSMakeRect(100, 100, 640, 480) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Form example"];
  [[self contentView] addSubview:button];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  NSAlert* alert = [[NSAlert alloc] init];
  [alert setMessageText:@"Close Form"];
  [alert setInformativeText:@"Are you sure you want exit?"];
  [alert setAlertStyle:NSAlertStyleWarning];
  [alert addButtonWithTitle:@"Yes"];
  [alert addButtonWithTitle:@"No"];
  NSModalResponse response = [alert runModal];
  if (response == NSAlertFirstButtonReturn) {
    [NSApp terminate:sender];
    return YES;
  }
  return NO;
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Form alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
