#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSComboBox* comboBox1;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  comboBox1 = [[[NSComboBox alloc] initWithFrame:NSMakeRect(10, 260, 121, 26)] autorelease];
  [comboBox1 addItemWithObjectValue:@"item1"];
  [comboBox1 addItemWithObjectValue:@"item2"];
  [comboBox1 addItemWithObjectValue:@"item3"];
  [comboBox1 selectItemAtIndex:1];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"ComboBox Example"];
  [[self contentView] addSubview:comboBox1];
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
  [[[[Form alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
