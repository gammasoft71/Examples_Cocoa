#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSImageView* pictureBox1;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  pictureBox1 = [[[NSImageView alloc] initWithFrame:NSMakeRect(10, 10, 280, 280)] autorelease];
  [pictureBox1 setImage:[NSImage imageNamed:@"Logo.png"]];
  [pictureBox1 setImageFrameStyle:(NSImageFrameGrayBezel)];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"PictureBox Example"];
  [[self contentView] addSubview:pictureBox1];
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
