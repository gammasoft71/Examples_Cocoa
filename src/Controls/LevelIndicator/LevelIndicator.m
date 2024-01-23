#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSLevelIndicator* levelIndicator1;
  NSLevelIndicator* levelIndicator2;
  NSLevelIndicator* levelIndicator3;
  NSLevelIndicator* levelIndicator4;
  NSLevelIndicator* levelIndicator5;
  NSTimer* timer;
}
- (instancetype)init;
- (void)onTimerTick:(NSTimer*)timer;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  levelIndicator1 = [[[NSLevelIndicator alloc] initWithFrame:NSMakeRect(50, 230, 200, 20)] autorelease];
  [levelIndicator1 setDoubleValue:0];
  
  levelIndicator2 = [[[NSLevelIndicator alloc] initWithFrame:NSMakeRect(50, 200, 200, 20)] autorelease];
  [levelIndicator2 setDoubleValue:2];
  
  levelIndicator3 = [[[NSLevelIndicator alloc] initWithFrame:NSMakeRect(50, 170, 200, 20)] autorelease];
  [levelIndicator3 setLevelIndicatorStyle:NSLevelIndicatorStyleContinuousCapacity];
  [levelIndicator3 setDoubleValue:4];
  
  levelIndicator4 = [[[NSLevelIndicator alloc] initWithFrame:NSMakeRect(50, 140, 200, 20)] autorelease];
  [levelIndicator4 setDoubleValue:0];
  
  levelIndicator5 = [[[NSLevelIndicator alloc] initWithFrame:NSMakeRect(50, 110, 200, 20)] autorelease];
  [levelIndicator5 setLevelIndicatorStyle:NSLevelIndicatorStyleRating];
  [levelIndicator5 setDoubleValue:3];

  timer = [NSTimer timerWithTimeInterval:0.4f target:self selector:@selector(onTimerTick:) userInfo:levelIndicator4 repeats:YES];
  [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
  
  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"LevelIndicator Example"];
  [[self contentView] addSubview:levelIndicator1];
  [[self contentView] addSubview:levelIndicator2];
  [[self contentView] addSubview:levelIndicator3];
  [[self contentView] addSubview:levelIndicator4];
  [[self contentView] addSubview:levelIndicator5];
  [self setIsVisible:YES];
  return self;
}

- (void)onTimerTick:(NSTimer*)timer {
  [levelIndicator4 setDoubleValue:[levelIndicator4 doubleValue] < [levelIndicator4 maxValue] ? [levelIndicator4 doubleValue] + 1 : [levelIndicator4 minValue]];
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
