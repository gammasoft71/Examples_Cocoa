#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSButton* checkBox1;
  NSButton* checkBox2;
  NSButton* checkBox3;
  NSButton* checkBox4;
  NSButton* checkBox5;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  checkBox1 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 250, 105, 20)] autorelease];
  [checkBox1 setTitle:@"Unchecked"];
  [checkBox1 setButtonType:NSButtonTypeSwitch];
  [checkBox1 setTarget:self];
  [checkBox1 setAction:@selector(OnCheckBox1Click:)];
  [checkBox1 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox1 setState:NSControlStateValueOff];
  
  checkBox2 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 220, 105, 20)] autorelease];
  [checkBox2 setTitle:@"Checked"];
  [checkBox2 setButtonType:NSButtonTypeSwitch];
  [checkBox2 setTarget:self];
  [checkBox2 setAction:@selector(OnCheckBox2Click:)];
  [checkBox2 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox2 setState:NSControlStateValueOn];
  
  checkBox3 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 190, 105, 20)] autorelease];
  [checkBox3 setTitle:@"Mixed"];
  [checkBox3 setAllowsMixedState:YES];
  [checkBox3 setButtonType:NSButtonTypeSwitch];
  [checkBox3 setTarget:self];
  [checkBox3 setAction:@selector(OnCheckBox3Click:)];
  [checkBox3 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox3 setState:NSControlStateValueMixed];

  checkBox4 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 160, 105, 25)] autorelease];
  [checkBox4 setTitle:@"Checked"];
  [checkBox4 setButtonType:NSButtonTypeOnOff];
  [checkBox4 setBezelStyle:NSBezelStyleRounded];
  [checkBox4 setTarget:self];
  [checkBox4 setAction:@selector(OnCheckBox4Click:)];
  [checkBox4 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox4 setState:NSControlStateValueOn];

  checkBox5 = [[[NSButton alloc] initWithFrame:NSMakeRect(30, 130, 105, 25)] autorelease];
  [checkBox5 setTitle:@"Unchecked"];
  [checkBox5 setButtonType:NSButtonTypeOnOff];
  [checkBox5 setBezelStyle:NSBezelStyleRounded];
  [checkBox5 setTarget:self];
  [checkBox5 setAction:@selector(OnCheckBox5Click:)];
  [checkBox5 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  [checkBox5 setState:NSControlStateValueOff];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"CheckBox example"];
  [[self contentView] addSubview:checkBox1];
  [[self contentView] addSubview:checkBox2];
  [[self contentView] addSubview:checkBox3];
  [[self contentView] addSubview:checkBox4];
  [[self contentView] addSubview:checkBox5];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}

- (IBAction) OnCheckBox1Click:(id)sender {
  [checkBox1 setState:NSControlStateValueOff];
  [checkBox1 setTitle: [self stateToString: [checkBox1 state]]];
}

- (IBAction) OnCheckBox2Click:(id)sender {
  [checkBox2 setTitle: [self stateToString: [checkBox2 state]]];
}

- (IBAction) OnCheckBox3Click:(id)sender {
  [checkBox3 setTitle: [self stateToString: [checkBox3 state]]];
}

- (IBAction) OnCheckBox4Click:(id)sender {
  [checkBox4 setTitle: [self stateToString: [checkBox4 state]]];
}

- (IBAction) OnCheckBox5Click:(id)sender {
  [checkBox5 setState:NSControlStateValueOff];
  [checkBox5 setTitle: [self stateToString: [checkBox5 state]]];
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
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
