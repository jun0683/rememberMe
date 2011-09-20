//
//  settingsWindowsController.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "settingsWindowsController.h"
#import "rememberDatas.h"

@implementation settingsWindowsController
@synthesize label;
@synthesize stepper;
@synthesize block;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    [stepper setIntegerValue:[[rememberDatas sharedInstance] loadTime]];
	[label setIntegerValue:[[rememberDatas sharedInstance] loadTime]];
}

- (IBAction) controlDidChange: (id) sender
{
	[label setIntegerValue:[sender intValue]];
	[[rememberDatas sharedInstance] saveTime:[sender intValue]];
}

- (void)controlTextDidChange:(NSNotification *)aNotification {
	if ([[aNotification name] isEqualToString:@"NSControlTextDidChangeNotification"]) {
		
		if ( [aNotification object] == label ) {
			[stepper setIntValue:[label intValue]];
			[[rememberDatas sharedInstance] saveTime:[label intValue]];
		}
	}
}

- (IBAction) done:(id)sender
{
	block();
	[self close];
}

- (void)changeTime:(Block)aBlock
{
	self.block = aBlock;
}


@end
