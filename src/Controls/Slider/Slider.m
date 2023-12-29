#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSSlider* slider1;
  NSSlider* slider2;
  NSTextField* textField;
}
- (instancetype)init;
- (void)onSliderChanged:(NSSlider*)slider;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  slider1 = [[[NSSlider alloc] initWithFrame:NSMakeRect(50, 230, 200, 20)] autorelease];
  [slider1 setDoubleValue:0.75];
  
  slider2 = [[[NSSlider alloc] initWithFrame:NSMakeRect(50, 190, 200, 40)] autorelease];
  [slider2 setNumberOfTickMarks:11];
  [slider2 setAllowsTickMarkValuesOnly:YES];
  [slider2 setDoubleValue:0.5];
  [slider2 setAction:@selector(onSliderChanged:)];
  
  textField = [[[NSTextField alloc] initWithFrame:NSMakeRect(50, 150, 200, 20)] autorelease];
  [textField setBezeled:NO];
  [textField setDrawsBackground:NO];
  [textField setEditable:NO];
  [textField setSelectable:NO];
  [textField setStringValue:[NSString stringWithFormat:@"%0.1f", [slider2 doubleValue]]];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Slider Example"];
  [[self contentView] addSubview:slider1];
  [[self contentView] addSubview:slider2];
  [[self contentView] addSubview:textField];
  [self setIsVisible:YES];
  return self;
}

- (void)onSliderChanged:(id)sender {
  [textField setStringValue:[NSString stringWithFormat:@"%0.1f", [slider2 doubleValue]]];
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
