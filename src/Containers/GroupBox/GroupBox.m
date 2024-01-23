#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSBox* groupBox1;
  NSBox* groupBox2;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  groupBox1 = [[NSBox alloc] initWithFrame:NSMakeRect(10, 10, 305, 460)];
  [groupBox1 setTitle:@"GroupBox 1"];
  
  groupBox2 = [[NSBox alloc] initWithFrame:NSMakeRect(325, 10, 305, 460)];
  [groupBox2 setTitle:@""];

  [super initWithContentRect:NSMakeRect(100, 100, 640, 480) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"GroupBox example"];
  [[self contentView] addSubview:groupBox1];
  [[self contentView] addSubview:groupBox2];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}
@end

int main(int argc, char* argv[]) {
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
