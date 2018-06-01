#include <Cocoa/Cocoa.h>

NSString* NSEventTypeToNSString(NSEventType eventType);
NSString* NSEventModifierFlagsToNSString(NSEventModifierFlags modifierFlags);

int main(int argc, char* argv[]) {
  NSWindow* form1 = [[[NSWindow alloc] initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
  [form1 setIsVisible:YES];
  
  [NSApplication sharedApplication];

  [NSApp setMainMenu:[[[NSMenu alloc] init] autorelease]];
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][0] setSubmenu:[[[NSMenu alloc] initWithTitle:[[NSProcessInfo processInfo] processName]] autorelease]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"About %@"], nil), [[NSProcessInfo processInfo] processName]] action:@selector(orderFrontStandardAboutPanel:) keyEquivalent:@""] autorelease]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"Services", nil) action:nil keyEquivalent:@""] autorelease]];
  [[[[[NSApp mainMenu] itemArray][0] submenu] itemArray][2] setSubmenu:[[[NSMenu alloc] init] autorelease]];
  [NSApp setServicesMenu:[[[[[NSApp mainMenu] itemArray][0] submenu] itemArray][2] submenu]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"Hide %@"],nil), [[NSProcessInfo processInfo] processName]] action:@selector(hide:) keyEquivalent:@"h"] autorelease]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"Hide Other", nil) action:@selector(hideOtherApplications:) keyEquivalent:@"h"] autorelease]];
  [[[[[NSApp mainMenu] itemArray][0] submenu] itemArray][4] setKeyEquivalentModifierMask:NSEventModifierFlagOption|NSEventModifierFlagCommand];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"Show All", nil) action:@selector(unhideAllApplications:) keyEquivalent:@""] autorelease]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString([NSString stringWithUTF8String:"Quit %@"] , nil), [[NSProcessInfo processInfo] processName]] action:@selector(terminate:) keyEquivalent:@"q"] autorelease]];
  
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][1] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"View" , nil)] autorelease]];
  
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][2] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Window" , nil)] autorelease]];
  [NSApp setWindowsMenu:[[[NSApp mainMenu] itemArray][2] submenu]];
  
  [[NSApp mainMenu] addItem:[[[NSMenuItem alloc] init] autorelease]];
  [[[NSApp mainMenu] itemArray][3] setSubmenu:[[[NSMenu alloc] initWithTitle:NSLocalizedString(@"Help" , nil)] autorelease]];
  [NSApp setHelpMenu:[[[NSApp mainMenu] itemArray][3] submenu]];

  // Creates your own message loop
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  [NSApp finishLaunching];
  bool hasIdle = true;
  while (true) {
    [pool release];
    pool = [[NSAutoreleasePool alloc] init];
    
    NSEvent* event = [NSApp nextEventMatchingMask:NSEventMaskAny untilDate: hasIdle ? [NSDate distantPast] : [NSDate distantFuture] inMode:NSDefaultRunLoopMode dequeue:YES];
    if (event != nil) {
      // --> run your own dispatcher...
      NSLog(@"Event [type=%@ location={%d, %d} modifierFlags={%@}]", NSEventTypeToNSString([event type]), (int)[event locationInWindow].x, (int)[event locationInWindow].y, NSEventModifierFlagsToNSString([event modifierFlags]));
      // <--
      
      [NSApp sendEvent:event];
      [NSApp updateWindows];
    } else if (hasIdle) {
      // --> run idle method...
      // remove comment to see idle evolution
      //static int idleCounter = 0;
      //NSLog(@"Idle %d", ++idleCounter);
      // <--
    }
  }
  [pool release];
}

NSString* NSEventTypeToNSString(NSEventType eventType) {
  switch (eventType) {
    case NSEventTypeLeftMouseDown: return @"LeftMouseDown";
    case NSEventTypeLeftMouseUp: return @"LeftMouseUp";
    case NSEventTypeRightMouseDown: return @"RightMouseDown";
    case NSEventTypeRightMouseUp: return @"RightMouseUp";
    case NSEventTypeMouseMoved: return @"MouseMoved";
    case NSEventTypeLeftMouseDragged: return @"LeftMouseDragged";
    case NSEventTypeRightMouseDragged: return @"RightMouseDragged";
    case NSEventTypeMouseEntered: return @"MouseEntered";
    case NSEventTypeMouseExited: return @"MouseExited";
    case NSEventTypeKeyDown: return @"KeyDown";
    case NSEventTypeKeyUp: return @"KeyUp";
    case NSEventTypeFlagsChanged: return @"FlagsChanged";
    case NSEventTypeAppKitDefined: return @"AppKitDefined";
    case NSEventTypeSystemDefined: return @"SystemDefined";
    case NSEventTypeApplicationDefined: return @"ApplicationDefined";
    case NSEventTypePeriodic: return @"Periodic";
    case NSEventTypeCursorUpdate: return @"CursorUpdate";
    case NSEventTypeScrollWheel: return @"ScrollWheel";
    case NSEventTypeTabletPoint: return @"TabletPoint";
    case NSEventTypeTabletProximity: return @"TabletProximity";
    case NSEventTypeOtherMouseDown: return @"OtherMouseDown";
    case NSEventTypeOtherMouseUp: return @"OtherMouseUp";
    case NSEventTypeOtherMouseDragged: return @"OtherMouseDragged";
    default: return [NSString stringWithFormat:@"%lu", eventType];
  }
}

NSString* NSEventModifierFlagsToNSString(NSEventModifierFlags modifierFlags) {
  NSString* result = @"";
  if ((modifierFlags & NSEventModifierFlagCapsLock) == NSEventModifierFlagCapsLock) result = [result stringByAppendingString:@"CapsLock, "];
  if ((modifierFlags & NSEventModifierFlagShift) == NSEventModifierFlagShift) result = [result stringByAppendingString:@"NShift, "];
  if ((modifierFlags & NSEventModifierFlagControl) == NSEventModifierFlagControl) result = [result stringByAppendingString:@"Control, "];
  if ((modifierFlags & NSEventModifierFlagOption) == NSEventModifierFlagOption) result = [result stringByAppendingString:@"Option, "];
  if ((modifierFlags & NSEventModifierFlagCommand) == NSEventModifierFlagCommand) result = [result stringByAppendingString:@"Command, "];
  if ((modifierFlags & NSEventModifierFlagNumericPad) == NSEventModifierFlagNumericPad) result = [result stringByAppendingString:@"NumericPad, "];
  if ((modifierFlags & NSEventModifierFlagHelp) == NSEventModifierFlagHelp) result = [result stringByAppendingString:@"Help, "];
  if ((modifierFlags & NSEventModifierFlagFunction) == NSEventModifierFlagFunction) result = [result stringByAppendingString:@"Function, "];
  return result;
}

