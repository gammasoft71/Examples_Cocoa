#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSTextField* textBox1;
  NSTextField* textBox2;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  textBox1 = [[[NSTextField alloc] initWithFrame:NSMakeRect(10, 270, 100, 20)] autorelease];
  [textBox1 setStringValue:@"textBox1"];
  
  textBox2 = [[[NSTextField alloc] initWithFrame:NSMakeRect(10, 230, 100, 20)] autorelease];
  [textBox2 setStringValue:@"textBox2"];
  
  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"TextBox Example"];
  [[self contentView] addSubview:textBox1];
  [[self contentView] addSubview:textBox2];
  [self makeFirstResponder:textBox2];
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
