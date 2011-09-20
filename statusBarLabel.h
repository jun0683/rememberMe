//
//  statusBarLabel.h
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>

typedef void (^block)();

@interface statusBarLabel : NSTextField
{
	
}

@property (nonatomic,copy) block popup;

- (void)setPopUpStatusItemMenu:(block)block;

@end
