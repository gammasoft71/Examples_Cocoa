#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSProgressIndicator* loadingIndicator1;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  loadingIndicator1 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(20, 250, 32, 32)] autorelease];
  [loadingIndicator1 setStyle:NSProgressIndicatorStyleSpinning];
  [loadingIndicator1 startAnimation:loadingIndicator1];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Loading Indicator Example"];
  [[self contentView] addSubview:loadingIndicator1];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
