//
//  RecordPopView.h
//  sky_chatforoc
//
//  Created by xyt on 2022/10/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    PopBlockCauseButtonClick = 0,
    PopBlockSureButtonClick
} PopBlockButtonClickIndex;


@interface RecordPopView : UIView
@property(nonatomic, copy) void (^buttonBlock) (NSInteger index);
@property(nonatomic, copy) void (^recordBlock) ();
@property(nonatomic, assign) BOOL isRecording;
@property(nonatomic, assign) BOOL isfinishRecord;
@property(nonatomic, assign) BOOL startingBool;

/** 弹窗主内容view */
@property (nonatomic,strong) UIView   *contentView;
@property(nonatomic, strong) UIButton * mkpButton;

@property (nonatomic,copy)    UIImageView *playimgView;


- (instancetype)initWithTittle:(NSString *)tittle message:(NSString *)message block:(void (^) (NSInteger index))block;

- (void)show;

-(void)record:(void (^)())block;
@end

NS_ASSUME_NONNULL_END
