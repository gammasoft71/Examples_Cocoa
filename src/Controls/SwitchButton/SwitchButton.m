#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSSwitch* switchButton1;
  NSSwitch* switchButton2;
  NSTextField* label1;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  switchButton1 = [[[NSSwitch alloc] initWithFrame:NSMakeRect(50, 250, 38, 25)] autorelease];
  [switchButton1 setTarget:self];
  [switchButton1 setAction:@selector(OnSwitchButton1Click:)];
  [switchButton1 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [switchButton1 setState:NSControlStateValueOff];
  
  switchButton2 = [[[NSSwitch alloc] initWithFrame:NSMakeRect(50, 210, 38, 25)] autorelease];
  [switchButton2 setTarget:self];
  [switchButton2 setAction:@selector(OnSwitchButton2Click:)];
  [switchButton2 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [switchButton2 setState:NSControlStateValueOn];

  
  label1 = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 170, 150, 20)];
  [label1 setStringValue:@"switch: On"];
  [label1 setBezeled:NO];
  [label1 setDrawsBackground:NO];
  [label1 setEditable:NO];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Switch button example"];
  [[self contentView] addSubview:switchButton1];
  [[self contentView] addSubview:switchButton2];
  [[self contentView] addSubview:label1];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}

- (IBAction) OnSwitchButton1Click:(id)sender {
  [switchButton1 setState:NSControlStateValueOff];
}

- (IBAction) OnSwitchButton2Click:(id)sender {
  [label1 setStringValue:[NSString stringWithFormat:@"switch: %@", [switchButton2 state] == NSControlStateValueOn ? @"On" : @"Off"]];
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
