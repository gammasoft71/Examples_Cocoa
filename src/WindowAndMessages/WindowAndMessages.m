#include <Cocoa/Cocoa.h>
#include <syslog.h>

@interface Window : NSWindow {
}
- (instancetype)init;
- (void)windowDidDeMiniaturize:(NSNotification*)sender;
- (void)windowDidEnterFullScreen:(NSNotification*)notification;
- (void)windowDidExitFullScreen:(NSNotification*)notification;
- (void)windowDidMove:(NSNotification*)notification;
- (void)windowDidResize:(NSNotification*)notification;
- (void)windowDidMiniaturize:(NSNotification*)sender;
- (BOOL)windowShouldClose:(NSWindow*)sender;
@end

@implementation Window
- (instancetype)init {
  [super initWithContentRect:NSMakeRect(100, 600, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Window and Messages"];
  [self setIsVisible:YES];

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidEnterFullScreen:) name:NSWindowDidEnterFullScreenNotification object:self];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidExitFullScreen:) name:NSWindowDidExitFullScreenNotification object:self];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidMove:) name:NSWindowDidMoveNotification object:self];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidResize:) name:NSWindowDidResizeNotification object:self];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidMiniaturize:) name:NSWindowDidMiniaturizeNotification object:self];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidDeMiniaturize:) name:NSWindowDidDeminiaturizeNotification object:self];

  return self;
}

- (void)windowDidDeMiniaturize:(NSNotification*)notification {
  syslog(LOG_EMERG | LOG_USER, "Resize");
}

- (void)windowDidEnterFullScreen:(NSNotification*)notification {
  syslog(LOG_EMERG | LOG_USER, "Enter full screen");
}

- (void)windowDidExitFullScreen:(NSNotification*)notification {
  syslog(LOG_EMERG | LOG_USER, "Exit full screen");
}

- (void)windowDidMove:(NSNotification*)notification {
  syslog(LOG_EMERG | LOG_USER, "Move");
}

- (void)windowDidResize:(NSNotification*)notification {
  syslog(LOG_EMERG | LOG_USER, "Resize");
}

- (void)windowDidMiniaturize:(NSNotification*)notification {
  syslog(LOG_EMERG | LOG_USER, "Minimize");
}

 - (BOOL)windowShouldClose:(NSWindow*)sender {
  syslog(LOG_EMERG | LOG_USER, "Should Close");
  [NSApp terminate:sender];
  return NO;
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
