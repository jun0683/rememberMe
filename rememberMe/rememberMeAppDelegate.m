//
//  rememberMeAppDelegate.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 16..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "rememberMeAppDelegate.h"

@implementation rememberMeAppDelegate

@synthesize window;
@synthesize statusItem;
@synthesize strings;
@synthesize timer;

- (void)awakeFromNib
{
	self.statusItem	= [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	[statusItem setTitle:@"우주미아홍구"];
	[NSRunningApplication currentApplication];

//	[statusItem setHighlightMode:YES];
	CGFloat length = ([statusItem length] == NSVariableStatusItemLength) ? 32.0f : [statusItem length];
	NSRect frame = NSMakeRect(0, 0, length, [[NSStatusBar systemStatusBar] thickness]);
	label =  [[NSTextField alloc] initWithFrame:frame];
	[label setStringValue:@"우주미아홍구"];
	[label setBezeled:NO];
//	[label setDrawsBackground:YES];
//	[label setBackgroundColor:[NSColor blueColor]];
	[label setEditable:NO];
	[label setSelectable:NO];
	[label setTranslatesAutoresizingMaskIntoConstraints:YES];
	[[label cell] setLineBreakMode:NSLineBreakByCharWrapping];
	[[label cell] setWraps:NO];
	statusItem.view = label;
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
	NSLog(@"%@",NSStringFromRect([[[statusItem view] window] frame]));
	self.timer = [NSTimer scheduledTimerWithTimeInterval:5 
												  target:self 
												selector:@selector(changeString) 
												userInfo:nil 
												 repeats:YES];
	
	NSLog(@"%@",NSStringFromSize([[[NSApplication sharedApplication] mainMenu] size]));
	NSLog(@"%f",[[[NSApplication sharedApplication] mainMenu] minimumWidth]);
	
	NSInteger item = [[[NSApplication sharedApplication] mainMenu] numberOfItems];
	NSLog(@"%@",[[[NSApplication sharedApplication] mainMenu] itemAtIndex:item-1]);
	NSLog(@"%@",NSStringFromRect([[[[[[NSApplication sharedApplication] mainMenu] itemAtIndex:item-1] view] window ] frame]));
	NSLog(@"%@",[[NSApplication sharedApplication] helpMenu]);
	NSLog(@"%@",[[NSApplication sharedApplication] mainMenu]);
	NSLog(@"%@",[[NSApplication sharedApplication] windowsMenu]);

	NSLog(@"what");
}

- (void)reloadString
{
	
}

- (void)changeString
{
		
	NSString *title = [strings objectAtIndex:index];
	NSSize titlesize = [title sizeWithAttributes:[NSDictionary dictionaryWithObject:[label font] 
										  forKey:NSFontAttributeName]];
	NSRect newFrame = [label frame];
	newFrame.size.width = titlesize.width + 8;

	[label setFrame:newFrame];
	[label setStringValue:title];
	
	NSLog(@"%d",index);
	NSLog(@"%@",NSStringFromRect(newFrame));
	NSLog(@"%@",NSStringFromRect([[[statusItem view] window] frame]));
	
	index++;
	if (index >= [strings count]) {
		index=0;
	}
	
}


@end
