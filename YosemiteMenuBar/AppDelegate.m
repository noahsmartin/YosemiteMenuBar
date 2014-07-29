//
//  AppDelegate.m
//  YosemiteMenuBar
//
//  Created by Noah Martin on 7/28/14.
//  Copyright (c) 2014 Noah Martin. All rights reserved.
//

#import "AppDelegate.h"
#import "YosemiteStatusItem.h"
#import "statusItemView.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSMenu *menu;
@property YosemiteStatusItem* statusItem;

@end

@implementation AppDelegate
            
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.statusItem = [[YosemiteStatusItem alloc] initWithLength:NSVariableStatusItemLength];
    statusItemView* view = [[statusItemView alloc] init];
    view.statusItem = self.statusItem.statusItem;
    view.menu = self.menu;
    [self.statusItem setCustomView:view];
    [view setupMenu];
    [self.statusItem startDrawing];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
