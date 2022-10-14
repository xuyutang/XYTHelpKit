//
//  ViewController.m
//  sky_chatforoc
//
//  Created by xyt on 2022/10/10.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    AlertBlockCauseButtonClick = 0,
    AlertBlockSureButtonClick
} AlertBlockButtonClickIndex;

@interface HLAlertViewBlock : UIView

@property(nonatomic, copy) void (^buttonBlock) (NSInteger index);
@property(nonatomic, copy) void (^playBlock) (NSDictionary* dic);
@property(nonatomic, copy) void (^stopBlock) ();
@property(nonatomic, copy) void (^reportBlock) ();
@property(nonatomic, copy) void (^deleteBlock) (NSDictionary* dic);;


@property (nonatomic,copy)    UIImageView *playimgView;

@property (nonatomic,copy) UIButton * playBtn;
- (instancetype)initWithTittle:(NSString *)tittle message:(NSString *)message dic:(NSDictionary*)dic block:(void (^) (NSInteger index))block;

- (void)show;

-(void)playWithBlock:(void (^) (NSDictionary* dic))block;


-(void)stop:(void (^)())block;

-(void)report:(void (^)())block;

-(void)deleteClick:(void (^)(NSDictionary* dic))block;
@end
