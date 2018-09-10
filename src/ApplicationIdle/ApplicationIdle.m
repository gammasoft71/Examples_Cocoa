#include <Cocoa/Cocoa.h>

NSString* NSEventTypeToNSString(NSEventType eventType);
NSString* NSEventModifierFlagsToNSString(NSEventModifierFlags modifierFlags);

int main(int argc, char* argv[]) {
  NSWindow* form1 = [[[NSWindow alloc] initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
  [form1 setIsVisible:YES];
  
  [NSApplication sharedApplication];

  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  [NSApp finishLaunching];
  while (true) {
    [pool release];
    pool = [[NSAutoreleasePool alloc] init];
    
    NSEvent* event = [NSApp nextEventMatchingMask:NSEventMaskAny untilDate: [NSDate distantPast] inMode:NSDefaultRunLoopMode dequeue:YES];
    if (event != nil) {
      [NSApp sendEvent:event];
      [NSApp updateWindows];
    } else {
      // idle...
      static int counter = 0;
      [form1 setTitle:[NSString stringWithFormat:@"%d", ++counter]];
    }
  }
  [pool release];
}

