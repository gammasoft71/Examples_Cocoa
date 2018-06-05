#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSButton* button;
  NSTextField* label;
}
- (IBAction) OnButtonClick:(id)sender;
- (void)changeFont:(id)sender;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  button = [[[NSButton alloc] initWithFrame:NSMakeRect(10, 365, 100, 32)] autorelease];
  [button setTitle:@"Font..."];
  [button setBezelStyle:NSBezelStyleRounded];
  [button setTarget:self];
  [button setAction:@selector(OnButtonClick:)];
  [button setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  label = [[[NSTextField alloc] initWithFrame:NSMakeRect(10, 10, 380, 345)] autorelease];
  [label setStringValue:@"The quick brown fox jumps over the lazy dog.\n"
   "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG.\n"
   "0123456789+-*/%~^&|=<>≤≥±÷≠{{[()]}},;:.?¿!¡\n"
   "àçéèêëïî@@°_#§$ù£€æœøπµ©®∞\\\"'\n"
   "\u0400{u0401\u0402\u0403\u0404\u0405\u0406\u0407\u0408\u0409\u040a\u040b\u040c\u040d\u040e\u040f\n"
   "\u0410\u0411\u0412\u0413\u0414\u0415\u0416\u0417\u0418\u0419\u041a\u041b\u041c\u041d\u041e\u041f\n"
   "\u4ea0\u4ea1\u4ea2\u4ea3\u4ea4\u4ea5\u4ea6\u4ea7\u4ea8\u4ea9\u4eaa\u4eab\u4eac\u4ead\u4eae\u4eaf\n"
   "\u4eb0\u4eb1\u4eb2\u4eb3\u4eb4\u4eb5\u4eb6\u4eb7\u4eb8\u4eb9\u4eba\u4ebb\u4ebc\u4ebd\u4ebe\u4ebf\n"
   "\U0001F428"];
  [label setBezeled:NO];
  [label setDrawsBackground:NO];
  [label setEditable:NO];
  [label setSelectable:NO];
  
  [super initWithContentRect:NSMakeRect(100, 100, 400, 400) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"FontDialog example"];
  [[self contentView] addSubview:button];
  [[self contentView] addSubview:label];
  [self setIsVisible:YES];
  return self;
}

- (IBAction) OnButtonClick:(id)sender {
  [[NSColorPanel sharedColorPanel] setColor:[label textColor]];
  [[NSFontManager sharedFontManager] setSelectedFont:[label font] isMultiple:NO];
  [[NSFontManager sharedFontManager] orderFrontFontPanel:self];
}

- (void)changeFont:(id)sender {
  [label setFont:[[NSFontManager sharedFontManager] selectedFont]];
  [label setTextColor:[[NSColorPanel sharedColorPanel] color]];
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return NO;
}
@end

int main(int argc, char* argv[]) {

  [NSApplication sharedApplication];
  [[[[Form alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
