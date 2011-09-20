//
//  rememberDatas.h
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>

@interface rememberDatas : NSObject {

}

+ (rememberDatas*) sharedInstance;

- (NSString*)loadString;
- (void)saveString:(NSString*)aString;

- (int)loadTime;
- (void)saveTime:(int)aTime;
@end
