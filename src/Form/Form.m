#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSButton* button;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  button = [[[NSButton alloc] initWithFrame:NSMakeRect(10, 443, 90, 32)] autorelease];
  [button setTitle:@"Close"];
  [button setBezelStyle:NSBezelStyleRounded];
  [button setAction:@selector(performClose:)];
  [button setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  [super initWithContentRect:NSMakeRect(320, 200, 640, 480) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Form example"];
  [[self contentView] addSubview:button];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  NSAlert* alert = [[NSAlert alloc] init];
  [alert setMessageText:@"Close Form"];
  [alert setInformativeText:@"Are you sure you want exit?"];
  [alert setAlertStyle:NSAlertStyleWarning];
  [alert addButtonWithTitle:@"Yes"];
  [alert addButtonWithTitle:@"No"];
  [alert beginSheetModalForWindow:self completionHandler:^(NSModalResponse returnCode) {
    if (returnCode == NSAlertFirstButtonReturn)
      [NSApp terminate:sender];
  }];
  return NO;
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Form alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
