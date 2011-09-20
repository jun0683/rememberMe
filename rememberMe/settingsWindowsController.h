//
//  settingsWindowsController.h
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef void (^Block)();

@interface settingsWindowsController : NSWindowController
{
	NSTextField *label;
	NSStepper *stepper;
}

@property (nonatomic,copy) Block block;
@property (assign) IBOutlet NSTextField *label;
@property (assign) IBOutlet NSStepper *stepper;

- (IBAction) controlDidChange: (NSStepper*) sender;
- (IBAction) done:(id)sender;

- (void)changeTime:(Block)aBlock;

@end
