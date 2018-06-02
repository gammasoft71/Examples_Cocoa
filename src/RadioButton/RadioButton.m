#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSButton* radioButton1;
  NSButton* radioButton2;
  NSButton* radioButton3;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  NSButton* radioButton1 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 245, 105, 20)] autorelease];
  [radioButton1 setTitle:@"radioButton 1"];
  [radioButton1 setButtonType:NSButtonTypeRadio];
  [radioButton1 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [radioButton1 setState:NSControlStateValueOn];
  
  NSButton* radioButton2 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 215, 105, 20)] autorelease];
  [radioButton2 setTitle:@"radioButton 2"];
  [radioButton2 setButtonType:NSButtonTypeSwitch];
  [radioButton2 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [radioButton2 setState:NSControlStateValueOff];
  
  NSButton* radioButton3 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 185, 105, 20)] autorelease];
  [radioButton3 setTitle:@"radioButton 3"];
  [radioButton3 setButtonType:NSButtonTypeSwitch];
  [radioButton3 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [radioButton3 setState:NSControlStateValueOff];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"RadioButton example"];
  [[self contentView] addSubview:radioButton1];
  [[self contentView] addSubview:radioButton2];
  [[self contentView] addSubview:radioButton3];
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
