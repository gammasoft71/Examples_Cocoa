#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSProgressIndicator* progressBar1;
  NSProgressIndicator* progressBar2;
  NSProgressIndicator* progressBar3;
  NSProgressIndicator* progressBar4;
  NSProgressIndicator* progressBar5;
  NSTimer* timer;
}
- (instancetype)init;
- (void)onTimerTick:(NSTimer*)timer;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  progressBar1 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(50, 230, 200, 20)] autorelease];
  [progressBar1 setIndeterminate:NO];
  [progressBar1 setDoubleValue:0];
  
  progressBar2 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(50, 200, 200, 20)] autorelease];
  [progressBar2 setIndeterminate:NO];
  [progressBar2 setDoubleValue:50];
  
  progressBar3 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(50, 170, 200, 20)] autorelease];
  [progressBar3 setIndeterminate:NO];
  [progressBar3 setDoubleValue:100];
  
  progressBar4 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(50, 140, 200, 20)] autorelease];
  [progressBar4 setIndeterminate:NO];
  [progressBar4 setDoubleValue:0];
  
  progressBar5 = [[[NSProgressIndicator alloc] initWithFrame:NSMakeRect(50, 110, 200, 20)] autorelease];
  [progressBar5 startAnimation:progressBar5];
  
  timer = [NSTimer timerWithTimeInterval:0.05f target:self selector:@selector(onTimerTick:) userInfo:progressBar4 repeats:YES];
  [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
  
  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"ProgressBar Example"];
  [[self contentView] addSubview:progressBar1];
  [[self contentView] addSubview:progressBar2];
  [[self contentView] addSubview:progressBar3];
  [[self contentView] addSubview:progressBar4];
  [[self contentView] addSubview:progressBar5];
  [self setIsVisible:YES];
  return self;
}

- (void)onTimerTick:(NSTimer*)timer {
  [progressBar4 setDoubleValue:[progressBar4 doubleValue] < [progressBar4 maxValue] ? [progressBar4 doubleValue] + 1 : [progressBar4 minValue]];
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
