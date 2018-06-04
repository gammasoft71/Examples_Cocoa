#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSTextField* label;
  NSButton* button;
  NSTimer* timer;
  int counter;
}
- (instancetype)init;
- (void)onButtonClick:(id)sender;
- (void)onTimerTick:(NSTimer*)timer;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  counter = 0;
  
  label = [[[NSTextField alloc] initWithFrame:NSMakeRect(10, 50, 210, 70)] autorelease];
  [label setStringValue:[NSString stringWithFormat:@"%.1f", (float)counter / 10]];
  //[label setStringValue:@"0.0"];
  [label setBezeled:NO];
  [label setDrawsBackground:NO];
  [label setEditable:NO];
  [label setSelectable:NO];
  [label setTextColor:[NSColor colorWithCalibratedRed:0.117f green:0.565f blue:1.0f alpha:1.0f]];
  [label setFont:[[NSFontManager sharedFontManager] convertFont:[[NSFontManager sharedFontManager] convertFont:[NSFont fontWithName:@"Arial" size:64] toHaveTrait:NSFontBoldTrait] toHaveTrait:NSFontItalicTrait]];

  button = [[[NSButton alloc] initWithFrame:NSMakeRect(10, 10, 90, 32)] autorelease];
  [button setAction:@selector(onButtonClick:)];
  [button setBezelStyle:NSBezelStyleRounded];
  [button setTitle:@"Start"];
  
  [super initWithContentRect:NSMakeRect(100, 100, 230, 130) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Label Example"];
  [[self contentView] addSubview:label];
  [[self contentView] addSubview:button];
  [self setIsVisible:YES];
  return self;
}

- (void)onButtonClick:(id)sender {
  if ([[button title]  isEqual: @"Start"]) {
    timer = [NSTimer timerWithTimeInterval:0.1f target:self selector:@selector(onTimerTick:) userInfo:self repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [button setTitle:@"Stop"];
  } else {
    [timer invalidate];
    [button setTitle:@"Start"];
  }
}

- (void)onTimerTick:(NSTimer*)timer {
  [label setStringValue:[NSString stringWithFormat:@"%.1f", (float)++counter / 10]];
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
