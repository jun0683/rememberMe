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
	self.statusItem	= [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	CGFloat length = ([statusItem length] == NSVariableStatusItemLength) ? 32.0f : [statusItem length];
	NSRect frame = NSMakeRect(0, 0, length, [[NSStatusBar systemStatusBar] thickness]);
	label =  [[statusBarLabel alloc] initWithFrame:frame];
	[label setPopUpStatusItemMenu:^(void) {
		[statusItem popUpStatusItemMenu:statusMenu];
	}];
	
	
	statusItem.view = label;
	[statusItem setHighlightMode:YES];
	
	
	
	ViewController = [[stringsViewController alloc] initWithWindowNibName:@"stringsViewController"];
	[ViewController changeString:^(NSString* string) {
		[self newStrings:string];
	}];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	self.strings = [NSArray arrayWithObjects:
						@"(잠 6:6)	 게으른 자여 개미에게 가서 그가 하는 것을 보고 지혜를 얻으라", 
						@"(잠 6:7)	 개미는 두령도 없고 감독자도 없고 통치자도 없으되",
						@"(잠 6:8)	 먹을 것을 여름 동안에 예비하며 추수 때에 양식을 모으느니라",
						@"(잠 6:9)	 게으른 자여 네가 어느 때까지 누워 있겠느냐 네가 어느 때에 잠이 깨어 일어나겠느냐 일어나겠느냐",
						@"(잠 6:10)	 좀더 자자, 좀더 졸자, 손을 모으고 좀더 누워 있자 하면",
						@"(잠 6:11)	 네 빈궁이 강도 같이 오며 네 곤핍이 군사 같이 이르리라",
						nil];
	index = 0;
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval:5 
												  target:self 
												selector:@selector(changeString) 
												userInfo:nil 
												 repeats:YES];
	
	[ViewController showWindow:self];
	
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
	NSSize titlesize = [title sizeWithAttributes:[NSDictionary dictionaryWithObject:[label font] 
										  forKey:NSFontAttributeName]];
	NSRect newFrame = [label frame];
	newFrame.size.width = titlesize.width + 8;

	[label setFrame:newFrame];
	[label setStringValue:title];
	
	index++;
	
	
}



@end
