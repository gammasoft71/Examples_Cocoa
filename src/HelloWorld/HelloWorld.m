#include <Cocoa/Cocoa.h>

@interface Form : NSWindow
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return NO;
}
@end

int main(int argc, char* argv[]) {
  NSTextField* label = [[[NSTextField alloc] initWithFrame:NSMakeRect(5, 100, 290, 100)] autorelease];
  [label setStringValue:@"Hello, World!"];
  [label setBezeled:NO];
  [label setDrawsBackground:NO];
  [label setEditable:NO];
  [label setSelectable:NO];
  [label setTextColor:[NSColor colorWithCalibratedRed:0.0f green:0.5f blue:0.0f alpha:1.0f]];
  [label setFont:[[NSFontManager sharedFontManager] convertFont:[[NSFontManager sharedFontManager] convertFont:[NSFont fontWithName:@"Arial" size:45] toHaveTrait:NSFontBoldTrait] toHaveTrait:NSFontItalicTrait]];
  
  Form* form = [[[Form alloc] initWithContentRect:NSMakeRect(0, 0, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
  [form setTitle:@"My first application"];
  [[form contentView] addSubview:label];
  [form center];
  [form setIsVisible:YES];
  
  NSString* processName = [[NSProcessInfo processInfo] processName];
  
  NSMenu* applicationMenu = [[[NSMenu alloc] init] autorelease];
  [applicationMenu addItem:[[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"About %@"] , nil), processName] action:@selector(orderFrontStandardAboutPanel:) keyEquivalent:@""] autorelease]];
  [applicationMenu addItem:[NSMenuItem separatorItem]];
  NSMenuItem* servicesMenuItem = [applicationMenu addItemWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Services"], nil) action:nil keyEquivalent:@""];
  NSMenu* servicesMenu = [[[NSMenu alloc] initWithTitle:@""] autorelease];
  [applicationMenu setSubmenu:servicesMenu forItem:servicesMenuItem];
  [applicationMenu addItem:[NSMenuItem separatorItem]];
  [applicationMenu addItemWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"Hide %@"],nil), processName] action:@selector(hide:) keyEquivalent:@"h"];
  NSMenuItem* hideOtherMenuItem = [applicationMenu addItemWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Hide Others"] , nil) action:@selector(hideOtherApplications:) keyEquivalent:@"h"];
  [hideOtherMenuItem setKeyEquivalentModifierMask:(NSEventModifierFlagOption|NSEventModifierFlagCommand)];
  [applicationMenu addItemWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Show All"] , nil) action:@selector(unhideAllApplications:) keyEquivalent:@""];
  [applicationMenu addItem:[NSMenuItem separatorItem]];
  [applicationMenu addItem:[[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"Quit %@"] , nil), processName] action:@selector(terminate:) keyEquivalent:@"q"] autorelease]];
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

  [NSApplication sharedApplication];
  [NSApp setMainMenu:mainMenu];
  [NSApp setServicesMenu:servicesMenu];
  [NSApp setWindowsMenu:windowMenu];
  [NSApp setHelpMenu:helpMenu];

  [form makeMainWindow];
  [NSApp run];
}
