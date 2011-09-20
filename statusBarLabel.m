//
//  statusBarLabel.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "statusBarLabel.h"

@implementation statusBarLabel

@synthesize popup;

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setBezeled:NO];
		[self setDrawsBackground:NO];
		[self setEditable:NO];
		[self setSelectable:NO];
		[self setTranslatesAutoresizingMaskIntoConstraints:YES];
		[[self cell] setLineBreakMode:NSLineBreakByCharWrapping];
		[[self cell] setWraps:NO];
    }
    
    return self;
}

- (void)setPopUpStatusItemMenu:(block)block
{
	self.popup = block;
}

- (void)mouseDown:(NSEvent *)theEvent
{
	popup();
}

@end
