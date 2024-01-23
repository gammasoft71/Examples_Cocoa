#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSTabViewItem* tabPage1;
  NSTabViewItem* tabPage2;
  NSTabViewItem* tabPage3;
  NSTabView* tabControl;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  NSTabViewItem* tabPage1 = [[NSTabViewItem alloc] init];
  [tabPage1 setLabel:@"tabPage1"];
  
  tabPage2 = [[NSTabViewItem alloc] init];
  [tabPage2 setLabel:@"tabPage2"];
  
  tabPage3 = [[NSTabViewItem alloc] init];
  [tabPage3 setLabel:@"tabPage3"];
  
  tabControl = [[NSTabView alloc] initWithFrame:NSMakeRect(10, 10, 370, 250)];
  [tabControl insertTabViewItem:tabPage1 atIndex:0];
  [tabControl insertTabViewItem:tabPage2 atIndex:1];
  [tabControl insertTabViewItem:tabPage3 atIndex:2];

  [super initWithContentRect:NSMakeRect(100, 100, 390, 270) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"TabControl example"];
  [[self contentView] addSubview:tabControl];
  [self setIsVisible:YES];
  return self;
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
