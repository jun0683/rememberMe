//
//  rememberMeAppDelegate.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 16..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "rememberMeAppDelegate.h"
#import "stringsViewController.h"
@implementation rememberMeAppDelegate

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
	
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval:60
												  target:self 
												selector:@selector(changeString) 
												userInfo:nil 
												 repeats:YES];
	
	ViewController = [[stringsViewController alloc] initWithWindowNibName:@"stringsViewController"];
	[ViewController changeString:^(NSString* string) {
		index = 0;
		[self newStrings:string];
		[self changeString];
	}];
	[ViewController loadString];

}

- (IBAction)stringsMenu:(id)sender
{
	[ViewController toggleVisibility:YES];
}

- (void)newStrings:(NSString*)aStrings
{
	self.strings = [aStrings componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

- (void)changeString
{
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
