#include <Cocoa/Cocoa.h>

int main(int argc, char* argv[]) {
  NSWindow* form1 = [[[NSWindow alloc] initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
  [form1 setIsVisible:YES];
  [NSApplication sharedApplication];
  [NSApp run];
}
