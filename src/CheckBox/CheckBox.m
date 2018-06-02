#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSButton* checkBox1;
  NSButton* checkBox2;
  NSButton* checkBox3;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  NSButton* checkBox1 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 245, 105, 20)] autorelease];
  [checkBox1 setTitle:@"Checked"];
  [checkBox1 setAllowsMixedState:YES];
  [checkBox1 setButtonType:NSButtonTypeSwitch];
  [checkBox1 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox1 setState:NSControlStateValueOn];
  
  NSButton* checkBox2 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 215, 105, 20)] autorelease];
  [checkBox2 setTitle:@"Unchecked"];
  [checkBox2 setAllowsMixedState:YES];
  [checkBox2 setButtonType:NSButtonTypeSwitch];
  [checkBox2 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox2 setState:NSControlStateValueOff];
  
  NSButton* checkBox3 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 185, 105, 20)] autorelease];
  [checkBox3 setTitle:@"Indeterminate"];
  [checkBox3 setAllowsMixedState:YES];
  [checkBox3 setButtonType:NSButtonTypeSwitch];
  [checkBox3 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox3 setState:NSControlStateValueMixed];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"CheckBox example"];
  [[self contentView] addSubview:checkBox1];
  [[self contentView] addSubview:checkBox2];
  [[self contentView] addSubview:checkBox3];
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
