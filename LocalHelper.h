//
//  LocalHelper.h
//  Sky Chat
//
//  Created by XYT on 2021/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocalHelper : NSObject
+ (LocalHelper*) sharedInstance;

//UserDefaults
-(id)getValueFromUserDefaultsWithKey:(NSString *)key;
-(void)removeFromUserDefaultsWithKey:(NSString *)key;
-(void)saveValueToUserDefaultsWithValue:(id)value key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
