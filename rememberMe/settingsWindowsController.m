//
//  settingsWindowsController.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import "settingsWindowsController.h"

@implementation settingsWindowsController
@synthesize label;
@synthesize stepper;

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
    
    [stepper setIntegerValue:10];
	[label setIntegerValue:10];
}

- (IBAction) controlDidChange: (id) sender
{
	[label setIntegerValue:[sender intValue]];
}

- (void)controlTextDidChange:(NSNotification *)aNotification {
	if ([[aNotification name] isEqualToString:@"NSControlTextDidChangeNotification"]) {
		
		if ( [aNotification object] == label ) {
			[stepper setIntValue:[label intValue]];
		}
	}
}


@end
