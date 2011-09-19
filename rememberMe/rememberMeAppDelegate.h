//
//  rememberMeAppDelegate.h
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 16..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface rememberMeAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow *window;
	NSStatusItem *statusItem;
	NSArray *strings;
	NSTimer *timer;
	NSTextField *label;
	int index;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic,retain) NSStatusItem *statusItem;
@property (nonatomic,retain) NSArray *strings;
@property (nonatomic,retain) NSTimer *timer;

@end
