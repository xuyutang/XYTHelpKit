//
//  TwinkleView.h

//  Created by xyt on 2022/10/11.
//  A TwinkleView like star

#import <UIKit/UIKit.h>
//#import "Singleton.h"

typedef void(^HSTwinkleCountdownBlock)(NSInteger second);

@interface TwinkleView : UIView
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) NSDate *startDate;

@property(nonatomic, assign) BOOL startingBool;

- (void)reset;
- (void)showAtLocation:(CGPoint) origin inView:(UIView *)view;
- (void)hide;
- (void)userForCat;
-(BOOL)beforeSaveJudge;
- (void)recover;


- (void)countdown:(HSTwinkleCountdownBlock)countdownBlock;
+ (instancetype)sharedInstance;
- (void)start;
-(void)setUpView;
-(void)invoid;
@end
