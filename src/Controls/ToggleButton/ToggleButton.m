#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSButton* toggleButton1;
  NSButton* toggleButton2;
  NSButton* toggleButton3;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  toggleButton1 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 250, 120, 25)] autorelease];
  [toggleButton1 setTitle:@"Unchecked"];
  [toggleButton1 setButtonType:NSButtonTypeOnOff];
  [toggleButton1 setBezelStyle:NSBezelStyleRounded];
  [toggleButton1 setTarget:self];
  [toggleButton1 setAction:@selector(OnToggleButton1Click:)];
  [toggleButton1 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [toggleButton1 setState:NSControlStateValueOff];
  
  toggleButton2 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 220, 120, 25)] autorelease];
  [toggleButton2 setTitle:@"Checked"];
  [toggleButton2 setButtonType:NSButtonTypeOnOff];
  [toggleButton2 setBezelStyle:NSBezelStyleRounded];
  [toggleButton2 setTarget:self];
  [toggleButton2 setAction:@selector(OnToggleButton2Click:)];
  [toggleButton2 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [toggleButton2 setState:NSControlStateValueOn];
  
  toggleButton3 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 190, 120, 25)] autorelease];
  [toggleButton3 setTitle:@"Mixed"];
  [toggleButton3 setAllowsMixedState:YES];
  [toggleButton3 setButtonType:NSButtonTypeOnOff];
  [toggleButton3 setBezelStyle:NSBezelStyleRounded];
  [toggleButton3 setTarget:self];
  [toggleButton3 setAction:@selector(OnToggleButton3Click:)];
  [toggleButton3 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [toggleButton3 setState:NSControlStateValueMixed];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Toggle button example"];
  [[self contentView] addSubview:toggleButton1];
  [[self contentView] addSubview:toggleButton2];
  [[self contentView] addSubview:toggleButton3];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}

- (IBAction) OnToggleButton1Click:(id)sender {
  [toggleButton1 setState:NSControlStateValueOff];
  [toggleButton1 setTitle: [self stateToString: [toggleButton1 state]]];
}

- (IBAction) OnToggleButton2Click:(id)sender {
  [toggleButton2 setTitle: [self stateToString: [toggleButton2 state]]];
}

- (IBAction) OnToggleButton3Click:(id)sender {
  [toggleButton3 setTitle: [self stateToString: [toggleButton3 state]]];
}

- (NSString*) stateToString:(NSControlStateValue)state {
  switch (state) {
    case NSControlStateValueOff: return @"Unchecked";
    case NSControlStateValueOn: return @"Checked";
    case NSControlStateValueMixed: return @"Mixed";
  }
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
