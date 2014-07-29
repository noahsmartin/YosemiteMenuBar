//
//  statusItemView.m
//  QuickRes
//
//  Created by Noah Martin on 8/21/12.
//  Copyright (c) 2012 Noah Martin. All rights reserved.
//

#import "statusItemView.h"

@interface statusItemView ()
@property int count;
@end

@implementation statusItemView
@synthesize statusItem;

#define StatusItemViewPaddingWidth  6
#define StatusItemViewPaddingHeight 3

- (void)drawRect:(NSRect)rect {
    NSDictionary *attr;

    [statusItem drawStatusBarBackgroundInRect:[self bounds]
                                withHighlight:isHighlighted];
    
    [[NSString stringWithFormat:@"%d", self.count] drawAtPoint:NSMakePoint(10, 6) withAttributes:attr];

}

- (void)mouseDown:(NSEvent *)event {
    NSEvent *currentEvent = [NSApp currentEvent];
    NSLog(@"mouseDown");
    if([currentEvent modifierFlags] & (NSControlKeyMask | NSCommandKeyMask)) {
        NSLog(@"mouse down flags");
        self.count--;
        [[self menu] setDelegate:self];
        [statusItem popUpStatusItemMenu:[self menu]];
        [self setNeedsDisplay:YES];
    }
    else {
        isHighlighted = YES;
    }
    [self setNeedsDisplay:YES];
}
- (void) mouseUp:(NSEvent *)theEvent {
    isHighlighted = NO;
    CGPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    CGRect rect = [self bounds];
    if ([self mouse:point inRect:rect]) {
        NSLog(@"clicked");
        self.count++;
    }
    [self setNeedsDisplay:YES];
}

- (void)rightMouseDown:(NSEvent *)event {
    NSLog(@"right button cliced");
    self.count--;
    [statusItem popUpStatusItemMenu:[self menu]];
    [self setNeedsDisplay:YES];
}

- (void)menuWillOpen:(NSMenu *)menu {
    isHighlighted = YES;
    [self setNeedsDisplay:YES];
}

- (void)menuDidClose:(NSMenu *)menu {
    isHighlighted = NO;
    [menu setDelegate:nil];
    [self setNeedsDisplay:YES];
}

- (void) setupMenu {
    [statusItem setLength:20];
    [[self menu] setDelegate:self];
    CGFloat barHeight = [[[NSApplication sharedApplication] mainMenu] menuBarHeight];

    [self setFrameSize:NSMakeSize(20, barHeight)];
    
    [self setNeedsDisplay:YES];
}

- (NSMenu *)menuForEvent:(NSEvent *)theEvent
{
    return nil;
}

@end
