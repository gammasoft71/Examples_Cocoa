#include <Cocoa/Cocoa.h>

int main(int argc, char* argv[]) {
  // Create Window
  NSWindow* form1 = [[[NSWindow alloc] initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
  [form1 setIsVisible:YES];

  // Creates Application and asociate menubar and specific menus.
  [NSApplication sharedApplication];

  // Run default message loop
  [NSApp run];
}
