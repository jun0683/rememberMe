//
//  rememberMeAppDelegate.h
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 16..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Growl-WithInstaller/Growl.h>

@class statusBarLabel;
@class stringsViewController;

@interface rememberMeAppDelegate : NSObject <GrowlApplicationBridgeDelegate> {

	NSStatusItem *statusItem;
	NSArray *strings;
	NSTimer *timer;
	NSWindowController *ViewController;
	int index;
	IBOutlet NSMenu *statusMenu;
}

@property (nonatomic,retain) NSWindowController *ViewController;
@property (nonatomic,retain) NSStatusItem *statusItem;
@property (nonatomic,retain) NSArray *strings;
@property (nonatomic,retain) NSTimer *timer;

- (IBAction)stringsMenu:(id)sender;
- (IBAction)settingMenu:(id)sender;

- (void)newStrings:(NSString*)strings;
- (void)notiGrowl:(NSString*)title;
- (void)changeString;
@end
