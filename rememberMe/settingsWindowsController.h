//
//  settingsWindowsController.h
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface settingsWindowsController : NSWindowController
{
	NSTextField *label;
	NSStepper *stepper;
}

@property (assign) IBOutlet NSTextField *label;
@property (assign) IBOutlet NSStepper *stepper;

- (IBAction) controlDidChange: (NSStepper*) sender;

@end
