#include <Cocoa/Cocoa.h>

@interface Window : NSWindow
- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag {
  [super initWithContentRect:contentRect styleMask:style backing:backingStoreType defer:flag];

  NSColor * white = [NSColor greenColor];
  NSRect rect1 = NSMakeRect (21, 21, 210, 210);
  [white set];
  NSRectFill (rect1);

  return self;
}
- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return NO;
}
@end

int main(int argc, char* argv[]) {
  // Create Window
  Window* window1 = [[[Window alloc] initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
  [window1 setTitle:@"Drawing Example"];
  [window1 setIsVisible:YES];
  
  // Creates Application and asociate menubar and specific menus.

  // Set window as mainWindow
  [window1 makeMainWindow];
  [window1 makeKeyWindow];
  
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
