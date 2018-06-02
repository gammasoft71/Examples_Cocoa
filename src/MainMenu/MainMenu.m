#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
}
- (instancetype)init;
- (void)fileNew:(id)sender;
- (void)fileOpen:(id)sender;
- (void)fileClose:(id)sender;
- (void)editUndo:(id)sender;
- (void)editRedo:(id)sender;
- (void)editCut:(id)sender;
- (void)editCopy:(id)sender;
- (void)editPaste:(id)sender;
- (void)editDelete:(id)sender;
- (void)editSelectAll:(id)sender;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  // Creates Application and asociate menubar and specific menus.
  [NSApplication sharedApplication];
  
  // Creae main menubar
  [NSApp setMainMenu:[[[NSMenu alloc] init] autorelease]];
  
  // Creates Application submenu with process name
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
  
  // Create File submenu
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][1] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"File" , nil)] autorelease]];
  [[[[NSApp mainMenu] itemArray][1] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"New"] , nil) action:@selector(fileNew:) keyEquivalent:@"n"] autorelease]];
  [[[[NSApp mainMenu] itemArray][1] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Open"] , nil) action:@selector(fileOpen:) keyEquivalent:@"o"] autorelease]];
  [[[[NSApp mainMenu] itemArray][1] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][1] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Close"] , nil) action:@selector(fileClose:) keyEquivalent:@"w"] autorelease]];

  // Create Edit submenu
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][2] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Edit" , nil)] autorelease]];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Undo"] , nil) action:@selector(editUndo:) keyEquivalent:@"z"] autorelease]];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Redo"] , nil) action:@selector(editRedo:) keyEquivalent:@"Z"] autorelease]];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Cut"] , nil) action:@selector(editCut:) keyEquivalent:@"x"] autorelease]];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Copy"] , nil) action:@selector(editCopy:) keyEquivalent:@"c"] autorelease]];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Paste"] , nil) action:@selector(editPaste:) keyEquivalent:@"v"] autorelease]];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Delete"] , nil) action:@selector(editDelete:) keyEquivalent:@"\b"] autorelease]];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Select all"] , nil) action:@selector(editSelectAll:) keyEquivalent:@"a"] autorelease]];

  // Creates View submenu
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][3] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"View" , nil)] autorelease]];
  
  // Creates Windows submenu
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][4] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Window" , nil)] autorelease]];
  [NSApp setWindowsMenu:[[[NSApp mainMenu] itemArray][4] submenu]];
  
  // Creates Help submenu
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][5] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Help" , nil)] autorelease]];
  [NSApp setHelpMenu:[[[NSApp mainMenu] itemArray][5] submenu]];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"MainMenu example"];
  [self setIsVisible:YES];
  return self;
}

- (void)fileNew:(id)sender {
  NSLog(@"MainMenu/File/New");
}

- (void)fileOpen:(id)sender {
  NSLog(@"MainMenu/File/Open");
}

- (void)fileClose:(id)sender {
  NSLog(@"MainMenu/File/Close");
}

- (void)editUndo:(id)sender {
  NSLog(@"MainMenu/Edit/Undo");
}

- (void)editRedo:(id)sender {
  NSLog(@"MainMenu/Edit/Redo");
}

- (void)editCut:(id)sender {
  NSLog(@"MainMenu/Edit/Cut");
}

- (void)editCopy:(id)sender {
  NSLog(@"MainMenu/Edit/Copy");
}

- (void)editPaste:(id)sender {
  NSLog(@"MainMenu/Edit/Paste");
}

- (void)editDelete:(id)sender {
  NSLog(@"MainMenu/Edit/Delete");
}

- (void)editSelectAll:(id)sender {
  NSLog(@"MainMenu/Edit/SelectAll");
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
