//
//  statusItemView.h
//  QuickRes
//
//  Created by Noah Martin on 8/21/12.
//  Copyright (c) 2012 Noah Martin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface statusItemView : NSView <NSMenuDelegate>
{
    __weak NSStatusItem *statusItem;
    BOOL isHighlighted;
}
@property (weak) NSStatusItem *statusItem;
- (void) setupMenu;


@end
