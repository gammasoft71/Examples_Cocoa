#include <Cocoa/Cocoa.h>

@interface Window : NSWindow {
  NSButton* button;
  NSTextField* label;
}
- (IBAction) OnButtonClick:(id)sender;
- (void)changeColor:(id)sender;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  button = [[[NSButton alloc] initWithFrame:NSMakeRect(10, 265, 100, 32)] autorelease];
  [button setTitle:@"Save..."];
  [button setBezelStyle:NSBezelStyleRounded];
  [button setTarget:self];
  [button setAction:@selector(OnButtonClick:)];
  [button setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  label = [[[NSTextField alloc] initWithFrame:NSMakeRect(10, 235, 280, 20)] autorelease];
  [label setStringValue:@"File ="];
  [label setBezeled:NO];
  [label setDrawsBackground:NO];
  [label setEditable:NO];
  [label setSelectable:NO];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"SaveFileDialog example"];
  [[self contentView] addSubview:button];
  [[self contentView] addSubview:label];
  [self setIsVisible:YES];
  return self;
}

- (IBAction) OnButtonClick:(id)sender {
  NSSavePanel* saveFileDialog = [[[NSSavePanel alloc] init] autorelease];
  [saveFileDialog setCanCreateDirectories:YES];
  [saveFileDialog setAllowedFileTypes:[NSArray arrayWithObjects:@"txt", @"md", nil]];
  [saveFileDialog setDirectoryURL:[NSURL fileURLWithPath:[NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES) firstObject]]];
  [saveFileDialog setNameFieldStringValue:@"MyFile.txt"];

  NSModalResponse response = [saveFileDialog runModal];
  if (response == NSModalResponseOK)
    [label setStringValue:[NSString stringWithFormat:@"File = %@", [[saveFileDialog URL] path]]];
}

- (void)changeColor:(id)sender {
  [self setBackgroundColor:[(NSColorPanel*)sender color]];
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return NO;
}
@end

int main(int argc, char* argv[]) {

  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
