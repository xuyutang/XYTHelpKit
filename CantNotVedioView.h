//
//  CantNotVedioView.h
//  sky_chatforoc
//
//  Created by xyt on 2022/10/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    VediotBlockCauseButtonClick = 0,
    VedioBlockSureButtonClick
} VedioBlockButtonClickIndex;

@interface CantNotVedioView : UIView
@property(nonatomic, copy) void (^buttonBlock) (NSInteger index);

- (instancetype)initWithTittle:(NSString *)tittle message:(NSString *)message block:(void (^) (NSInteger index))block;

- (void)show;

@end

NS_ASSUME_NONNULL_END
