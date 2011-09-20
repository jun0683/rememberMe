//
//  stringsViewController.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "stringsViewController.h"
#import "rememberDatas.h"

@implementation stringsViewController

@synthesize newStringBlock;
@synthesize storedString;

-(id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
    }
    
    return self;
}

- (void)windowDidLoad
{
	textView.string = storedString;
}

- (IBAction)done:(id)sender
{
	[[NSUserDefaults standardUserDefaults] setValue:textView.string forKey:@"stringsViewStoredString"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	newStringBlock(textView.string);
	[self toggleVisibility:NO];
}

- (void)toggleVisibility:(bool)aVisible
{
	if (aVisible) 
    {
		[self showWindow:self];
	}
	else {
		
		[self close];
		
	}
}

- (void)changeString:(stringWithBlock)block
{
	self.newStringBlock = block;
}

- (void)loadString
{
	self.storedString = [[NSUserDefaults standardUserDefaults] stringForKey:@"stringsViewStoredString"];
	if ([storedString length] == 0) {
		self.storedString = @"(잠 6:6)	 게으른 자여 개미에게 가서 그가 하는 것을 보고 지혜를 얻으라\n(잠 6:7)	 개미는 두령도 없고 감독자도 없고 통치자도 없으되\n(잠 6:8)	 먹을 것을 여름 동안에 예비하며 추수 때에 양식을 모으느니라\n(잠 6:9)	 게으른 자여 네가 어느 때까지 누워 있겠느냐 네가 어느 때에 잠이 깨어 일어나겠느냐 일어나겠느냐\n(잠 6:10)	 좀더 자자, 좀더 졸자, 손을 모으고 좀더 누워 있자 하면\n(잠 6:11)	 네 빈궁이 강도 같이 오며 네 곤핍이 군사 같이 이르리라";
		[[NSUserDefaults standardUserDefaults] setValue:storedString forKey:@"stringsViewStoredString"];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
	newStringBlock(storedString);
}


@end
