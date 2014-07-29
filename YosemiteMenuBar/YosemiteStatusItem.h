//
//  NSStatusItem_YosemiteMenuBar.h
//  YosemiteMenuBar
//
//  Created by Noah Martin on 7/28/14.
//  Copyright (c) 2014 Noah Martin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface YosemiteStatusItem : NSObject

@property NSStatusItem* statusItem;

-(instancetype)initWithLength:(CGFloat)width;

-(void)setCustomView:(NSView*)view;

-(void)startDrawing;

-(void)stopDrawing;

@end
