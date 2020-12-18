#include <Foundation/Foundation.h>
#include <Cocoa/Cocoa.h>
#include <mach/mach_time.h>

NSString* NSEventTypeToNSString(NSEventType eventType);
NSString* NSEventModifierFlagsToNSString(NSEventModifierFlags modifierFlags);

int main(int argc, char* argv[]) {
  NSWindow* window1 = [[[NSWindow alloc] initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
  [window1 setIsVisible:YES];
  
  [NSApplication sharedApplication];

  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  [NSApp finishLaunching];

  mach_timebase_info_data_t timeBaseInfo;
  mach_timebase_info(&timeBaseInfo);

  while (true) {
    [pool release];
    pool = [[NSAutoreleasePool alloc] init];
    
    NSEvent* event = [NSApp nextEventMatchingMask:NSEventMaskAny untilDate: [NSDate distantPast] inMode:NSDefaultRunLoopMode dequeue:YES];
    if (event != nil) {
      [NSApp sendEvent:event];
      [NSApp updateWindows];
    } else {
      // idle...
      static uint64_t lastidleTime = 0;
      uint64_t elapsedTime = (mach_absolute_time() - lastidleTime) * timeBaseInfo.numer / timeBaseInfo.denom / 1000000;

      static int counter = 0;

      if (elapsedTime >= 100) {
        [window1 setTitle:[NSString stringWithFormat:@"%d", ++counter]];
        lastidleTime = mach_absolute_time();
      }
    }
  }
  [pool release];
}

