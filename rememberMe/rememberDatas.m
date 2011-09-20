//
//  rememberDatas.m
//  rememberMe
//
//  Created by kim hongjun on 11. 9. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "rememberDatas.h"

static rememberDatas *_instance;
@implementation rememberDatas

#pragma mark -
#pragma mark Singleton Methods

+ (rememberDatas*)sharedInstance
{
	@synchronized(self) {
		
        if (_instance == nil) {
			
            _instance = [[self alloc] init];
            
            // Allocate/initialize any member variables of the singleton class here
            // example
			//_instance.member = @"";
        }
    }
    return _instance;
}

+ (id)allocWithZone:(NSZone *)zone

{	
    @synchronized(self) {
		
        if (_instance == nil) {
			
            _instance = [super allocWithZone:zone];			
            return _instance;  // assignment and return on first allocation
        }
    }
	
    return nil; //on subsequent allocation attempts return nil	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}

- (id)retain
{	
    return self;	
}

- (NSUInteger)retainCount
{
    return UINT_MAX;  //denotes an object that cannot be released
}

- (oneway void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;	
}

#pragma mark -
#pragma mark Custom Methods

- (NSString*)loadString
{
	NSString* String = [[NSUserDefaults standardUserDefaults] stringForKey:@"stringsViewStoredString"];
	if ([String length] == 0) {
		String = @"(잠 6:6)	 게으른 자여 개미에게 가서 그가 하는 것을 보고 지혜를 얻으라\n(잠 6:7)	 개미는 두령도 없고 감독자도 없고 통치자도 없으되\n(잠 6:8)	 먹을 것을 여름 동안에 예비하며 추수 때에 양식을 모으느니라\n(잠 6:9)	 게으른 자여 네가 어느 때까지 누워 있겠느냐 네가 어느 때에 잠이 깨어 일어나겠느냐 일어나겠느냐\n(잠 6:10)	 좀더 자자, 좀더 졸자, 손을 모으고 좀더 누워 있자 하면\n(잠 6:11)	 네 빈궁이 강도 같이 오며 네 곤핍이 군사 같이 이르리라";
		[self saveString:String];
	}
	return String;
}

- (void)saveString:(NSString*)aString
{
	[[NSUserDefaults standardUserDefaults] setValue:aString forKey:@"stringsViewStoredString"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}


@end
