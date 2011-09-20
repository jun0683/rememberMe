//
//  rememberMeAppDelegate.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 16..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "rememberMeAppDelegate.h"
#import "statusBarLabel.h"
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
//	CGFloat length = ([statusItem length] == NSVariableStatusItemLength) ? 32.0f : [statusItem length];
//	NSRect frame = NSMakeRect(0, 0, length, [[NSStatusBar systemStatusBar] thickness]);
	
//	label =  [[statusBarLabel alloc] initWithFrame:frame];
//	[label setPopUpStatusItemMenu:^(void) {
//		[statusItem popUpStatusItemMenu:statusMenu];
//	}];
//	
//	
//	statusItem.view = label;
	[statusItem setHighlightMode:YES];
	
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	index = 0;
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval:1
												  target:self 
												selector:@selector(changeString) 
												userInfo:nil 
												 repeats:YES];
	
	ViewController = [[stringsViewController alloc] initWithWindowNibName:@"stringsViewController"];
	[ViewController changeString:^(NSString* string) {
		[self newStrings:string];
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
//	NSSize titlesize = [title sizeWithAttributes:[NSDictionary dictionaryWithObject:[label font] 
//										  forKey:NSFontAttributeName]];
//	NSRect newFrame = [label frame];
//	newFrame.size.width = titlesize.width + 8;
//
//	[label setFrame:newFrame];
//	[label setStringValue:title];
	
	index++;
	
	
}



@end
