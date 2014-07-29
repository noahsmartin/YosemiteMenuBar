//
//  YosemiteStatusItem.m
//  YosemiteMenuBar
//
//  Created by Noah Martin on 7/28/14.
//  Copyright (c) 2014 Noah Martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YosemiteStatusItem.h"

@interface YosemiteStatusItem()

@property (nonatomic) NSView* customView;
@property NSTimer* timer;

@end

@implementation YosemiteStatusItem

-(instancetype)initWithLength:(CGFloat)width {
    if(self = [super init]) {
        self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:width];
    }
    return self;
}

-(void)setCustomView:(NSView*)view {
    _customView = view;
    if([self.statusItem respondsToSelector:@selector(button)]) {
        NSStatusBarButton* button = [self.statusItem button];
        [button sendActionOn:NSLeftMouseDownMask | NSLeftMouseUpMask | NSRightMouseDownMask | NSRightMouseUpMask];
        [button setTarget:self];
        [button setAction:@selector(clicked)];
    } else {
        self.statusItem.view = self.customView;
    }
}

-(void)clicked {
    NSEvent *currentEvent = [NSApp currentEvent];
    if([currentEvent type] == NSRightMouseUp) {
        [self.customView rightMouseUp:currentEvent];
    } else if([currentEvent type] == NSRightMouseDown) {
        [self.customView rightMouseDown:currentEvent];
    } else if([currentEvent type] == NSLeftMouseUp) {
        [self.customView mouseUp:currentEvent];
    } else if([currentEvent type] == NSLeftMouseDown) {
        [self.customView mouseDown:currentEvent];
    }
}

-(void)startDrawing {
    if([self.statusItem respondsToSelector:@selector(button)]) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(update) userInfo:nil repeats:YES];
    }
}

-(void)stopDrawing {
    [self.timer invalidate];
}

-(void)update {
    CGFloat barHeight = [[[NSApplication sharedApplication] mainMenu] menuBarHeight];
    CGFloat width = self.customView.bounds.size.width;
    NSImage* image = [[NSImage alloc] initWithSize:NSMakeSize(width, barHeight)];
    [image lockFocus];
    [self.customView drawRect:NSMakeRect(0, 0, width, barHeight)];
    [image unlockFocus];
    [image setTemplate:YES];
    [self.statusItem setImage:image];
}

@end