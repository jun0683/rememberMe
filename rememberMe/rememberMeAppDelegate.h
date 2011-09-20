//
//  rememberMeAppDelegate.h
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 16..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class statusBarLabel;
@class stringsViewController;

@interface rememberMeAppDelegate : NSObject <NSApplicationDelegate> {

	NSStatusItem *statusItem;
	NSArray *strings;
	NSTimer *timer;
	statusBarLabel *label;
	stringsViewController *ViewController;
	int index;
	IBOutlet NSMenu *statusMenu;
}


@property (nonatomic,retain) NSStatusItem *statusItem;
@property (nonatomic,retain) NSArray *strings;
@property (nonatomic,retain) NSTimer *timer;

- (IBAction)stringsMenu:(id)sender;
- (void)newStrings:(NSString*)strings;

@end
