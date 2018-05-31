#include <Cocoa/Cocoa.h>

@interface CheckBox : NSButton
- (IBAction) OnClick:(id)sender;
@end

@implementation CheckBox
- (IBAction) OnClick:(id)sender {
}
@end

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
  // Create CheckBox
  CheckBox* checkBox1 = [[[CheckBox alloc] initWithFrame:NSMakeRect(30, 245, 105, 20)] autorelease];
  [checkBox1 setTitle:@"Checked"];
  [checkBox1 setAllowsMixedState:YES];
  [checkBox1 setButtonType:NSButtonTypeSwitch];
  [checkBox1 setTarget:checkBox1];
  [checkBox1 setAction:@selector(OnClick:)];
  [checkBox1 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox1 setState:NSControlStateValueOn];
  
  CheckBox* checkBox2 = [[[CheckBox alloc] initWithFrame:NSMakeRect(30, 215, 105, 20)] autorelease];
  [checkBox2 setTitle:@"Unchecked"];
  [checkBox2 setAllowsMixedState:YES];
  [checkBox2 setButtonType:NSButtonTypeSwitch];
  [checkBox2 setTarget:checkBox2];
  [checkBox2 setAction:@selector(OnClick:)];
  [checkBox2 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox2 setState:NSControlStateValueOff];
  
  CheckBox* checkBox3 = [[[CheckBox alloc] initWithFrame:NSMakeRect(30, 185, 105, 20)] autorelease];
  [checkBox3 setTitle:@"Indeterminate"];
  [checkBox3 setAllowsMixedState:YES];
  [checkBox3 setButtonType:NSButtonTypeSwitch];
  [checkBox3 setTarget:checkBox3];
  [checkBox3 setAction:@selector(OnClick:)];
  [checkBox3 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox3 setState:NSControlStateValueMixed];

  // Create Form
  Form* form1 = [[[Form alloc] initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
  [form1 setTitle:@"CheckBox example"];
  [[form1 contentView] addSubview:checkBox1];
  [[form1 contentView] addSubview:checkBox2];
  [[form1 contentView] addSubview:checkBox3];
  [form1 setIsVisible:YES];
  
  // Gets process name
  NSString* processName = [[NSProcessInfo processInfo] processName];
  
  // Creates Application submenu with process name
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

  // Creates Application and asociate menubar and specific menus.
  [NSApplication sharedApplication];
  [NSApp setMainMenu:mainMenu];
  [NSApp setServicesMenu:servicesMenu];
  [NSApp setWindowsMenu:windowMenu];
  [NSApp setHelpMenu:helpMenu];

  // Set window as mainWindow
  [form1 makeMainWindow];
  
  // Creates your own message loop
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  [NSApp finishLaunching];
  bool hasIdle = true;
  while (true) {
    [pool release];
    pool = [[NSAutoreleasePool alloc] init];
    
    NSEvent* event = [NSApp nextEventMatchingMask:NSEventMaskAny untilDate: hasIdle ? [NSDate distantPast] : [NSDate distantFuture] inMode:NSDefaultRunLoopMode dequeue:YES];
    if (event != nil) {
      // run your own dispatcher...
      [NSApp sendEvent:event];
      [NSApp updateWindows];
    } else if (hasIdle) {
      // run idle method...
    }
  }
  [pool release];
}
