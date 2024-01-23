#include <Cocoa/Cocoa.h>

int main(int argc, char* argv[]) {
  NSWindow* window1 = [[[NSWindow alloc] initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
  [window1 setIsVisible:YES];
  [NSApp run];
}
