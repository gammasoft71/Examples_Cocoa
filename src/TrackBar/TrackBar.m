#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSSlider* trackBar;
  NSProgressIndicator* progressBar;
  NSTextField* label;
}
- (instancetype)init;
- (IBAction) valueChanged:(id)sender;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  trackBar = [[[NSSlider alloc] initWithFrame:NSMakeRect(20, 215, 200, 20)] autorelease];
  [trackBar setAction:@selector(valueChanged:)];
  [trackBar setMaxValue:200];
  [trackBar setDoubleValue:100];
  
  progressBar = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(20, 180, 200, 20)] autorelease];
  [progressBar setMaxValue:200];
  [progressBar setIndeterminate:NO];
  [progressBar setDoubleValue:100];
  
  label = [[[NSTextField alloc] initWithFrame:NSMakeRect(20, 130, 100, 20)] autorelease];
  [label setStringValue:@"100"];
  [label setBezeled:NO];
  [label setDrawsBackground:NO];
  [label setEditable:NO];
  [label setSelectable:NO];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"TrackBar Example"];
  [[self contentView] addSubview:trackBar];
  [[self contentView] addSubview:progressBar];
  [[self contentView] addSubview:label];
  [self setIsVisible:YES];
  return self;
}

- (IBAction) valueChanged:(id)sender {
  [progressBar setDoubleValue:[trackBar doubleValue]];
  [label setStringValue:[NSString stringWithFormat:@"%d", (int)[trackBar doubleValue]]];
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
