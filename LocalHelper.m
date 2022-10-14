//
//  LocalHelper.m
//  Sky Chat
//
//  Created by XYT on 2021/10/12.
//

#import "LocalHelper.h"

@implementation LocalHelper

+(LocalHelper*)sharedInstance
{
    
    static LocalHelper* sharedInstance = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[LocalHelper alloc] init];
    });
    
    return sharedInstance;
}

//----NSUserDefaults----
-(id)getValueFromUserDefaultsWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id obj = [defaults objectForKey:key] ;
    return (obj == nil) ? @"" : obj;
}

-(void)removeFromUserDefaultsWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}

-(void)saveValueToUserDefaultsWithValue:(id)value key:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

@end
