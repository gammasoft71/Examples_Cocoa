#include <Cocoa/Cocoa.h>

@interface Form : NSWindow
- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag {
  [super initWithContentRect:contentRect styleMask:style backing:backingStoreType defer:flag];

  NSColor * white = [NSColor greenColor];
  NSRect rect1 = NSMakeRect ( 21,21,210,210 );
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
  // Create Form
  Form* form1 = [[[Form alloc] initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
  [form1 setTitle:@"Form Example"];
  [form1 setIsVisible:YES];
  
  // Creates Application and asociate menubar and specific menus.
  [NSApplication sharedApplication];

  // Set window as mainWindow
  [form1 makeMainWindow];
  [form1 makeKeyWindow];
  
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
