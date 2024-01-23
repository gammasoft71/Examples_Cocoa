#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSProgressIndicator* progressIndicator1;
  NSProgressIndicator* progressIndicator2;
  NSProgressIndicator* progressIndicator3;
  NSProgressIndicator* progressIndicator4;
  NSProgressIndicator* progressIndicator5;
  NSTimer* timer;
}
- (instancetype)init;
- (void)onTimerTick:(NSTimer*)timer;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  progressIndicator1 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(50, 230, 200, 20)] autorelease];
  [progressIndicator1 setIndeterminate:NO];
  [progressIndicator1 setDoubleValue:0];
  
  progressIndicator2 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(50, 200, 200, 20)] autorelease];
  [progressIndicator2 setIndeterminate:NO];
  [progressIndicator2 setDoubleValue:50];
  
  progressIndicator3 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(50, 170, 200, 20)] autorelease];
  [progressIndicator3 setIndeterminate:NO];
  [progressIndicator3 setDoubleValue:100];
  
  progressIndicator4 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(50, 140, 200, 20)] autorelease];
  [progressIndicator4 setIndeterminate:NO];
  [progressIndicator4 setDoubleValue:0];
  
  progressIndicator5 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(50, 110, 200, 20)] autorelease];
  [progressIndicator5 startAnimation:progressIndicator5];
  
  timer = [NSTimer timerWithTimeInterval:0.05f target:self selector:@selector(onTimerTick:) userInfo:progressIndicator4 repeats:YES];
  [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
  
  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"ProgressBar Example"];
  [[self contentView] addSubview:progressIndicator1];
  [[self contentView] addSubview:progressIndicator2];
  [[self contentView] addSubview:progressIndicator3];
  [[self contentView] addSubview:progressIndicator4];
  [[self contentView] addSubview:progressIndicator5];
  [self setIsVisible:YES];
  return self;
}

- (void)onTimerTick:(NSTimer*)timer {
  [progressIndicator4 setDoubleValue:[progressIndicator4 doubleValue] < [progressIndicator4 maxValue] ? [progressIndicator4 doubleValue] + 1 : [progressIndicator4 minValue]];
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
