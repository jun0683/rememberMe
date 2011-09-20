//
//  rememberMeAppDelegate.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 16..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "rememberMeAppDelegate.h"
#import "stringsWindowController.h"
#import "settingsWindowController.h"
#import "rememberDatas.h"
@implementation rememberMeAppDelegate


@synthesize windowController;
@synthesize statusItem;
@synthesize strings;
@synthesize timer;

- (void)awakeFromNib
{
	self.statusItem	= [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
	
	NSImage *icon = [NSImage imageNamed:@"modBrainIcon1.png"];
	[icon setSize:NSMakeSize([[NSStatusBar systemStatusBar] thickness], [[NSStatusBar systemStatusBar] thickness]-5)];
	[statusItem setImage:icon];
	[statusItem setMenu:statusMenu];
	[statusItem setHighlightMode:YES];
	
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	
	
	
	
	[self reLoadStrings];
	[self changeString];
	[self reLoadTime];

}

- (IBAction)settingMenu:(id)sender
{
	[windowController close];
	self.windowController = [[[settingsWindowController alloc] initWithWindowNibName:@"settingsWindow"] autorelease];
	[windowController showWindow:windowController.window];
	[(settingsWindowController*)windowController changeTime:^(void) {
		[self reLoadTime];
	}];
	
}

- (IBAction)stringsMenu:(id)sender
{
	[windowController close];
	self.windowController = [[[stringsWindowController alloc] initWithWindowNibName:@"stringsWindowController"] autorelease];
	[(stringsWindowController*)windowController changeString:^(NSString* string) {
		index = 0;
		[self reLoadStrings];
		[self changeString];
	}];
	[(stringsWindowController*)windowController toggleVisibility:YES];
}

- (void)reLoadTime
{
	double time = [[rememberDatas sharedInstance] loadTime]*1;
	[timer invalidate];
	self.timer = [NSTimer scheduledTimerWithTimeInterval:time
												  target:self 
												selector:@selector(changeString) 
												userInfo:nil 
												 repeats:YES];
}

- (void)reLoadStrings
{
	self.strings = [[[rememberDatas sharedInstance] loadString] componentsSeparatedByCharactersInSet:
					[NSCharacterSet newlineCharacterSet]];
}

- (void)changeString
{
	if ([strings count] == 0)
		return;
	
	if (index >= [strings count]) {
		index=0;
	}	
	NSString *title = [strings objectAtIndex:index];
	
	[self notiGrowl:title];
	
	index++;
}

- (void)notiGrowl:(NSString*)title
{
	NSBundle *myBundle = [NSBundle bundleForClass:[rememberMeAppDelegate class]];
	NSString *growlPath = [[myBundle privateFrameworksPath] stringByAppendingPathComponent:@"Growl-WithInstaller.framework"];
	NSBundle *growlBundle = [NSBundle bundleWithPath:growlPath];
	
	if (growlBundle && [growlBundle load]) {
		// Register ourselves as a Growl delegate
		[GrowlApplicationBridge setGrowlDelegate:self];
		
		[GrowlApplicationBridge notifyWithTitle:@"Remember Me!!"
									description:title
							   notificationName:@"Example"
									   iconData:[[NSImage imageNamed:@"modBrainIcon1.png"] TIFFRepresentation]
									   priority:0
									   isSticky:YES
								   clickContext:[NSDate date]];
	}
	else {
		NSLog(@"ERROR: Could not load Growl.framework");
	}
}



@end
