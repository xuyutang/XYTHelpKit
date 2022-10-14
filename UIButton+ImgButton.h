//
//  UIButton+ImgButton.h
//  sky_chatforoc
//
//  Created by xyt on 2022/10/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//UIButton重新布局的类型
typedef NS_ENUM(NSInteger, GHImagePosition) {
    GHImagePositionNull = 0,
    GHImagePositionLeft = 1,              //图片在左，文字在右，默认
    GHImagePositionRight = 2,             //图片在右，文字在左
    GHImagePositionTop = 3,               //图片在上，文字在下
    GHImagePositionBottom = 4,            //图片在下，文字在上
};

@interface UIButton (ImgButton)

/**
 *  文本和图片间的间距
 */
@property (assign, nonatomic) CGFloat subMargin;

/**
 *  布局的类型
 */
@property (assign, nonatomic) GHImagePosition layoutType;

/**
 *  对按钮内部的图片和文本重新进行布局
 *
 *  @param layoutType 重新布局的类型
 *  @param subMargin  内部图片和文本之间的间距
 */
- (void)layoutWithType:(GHImagePosition)layoutType subMargin:(CGFloat)subMargin;

NS_ASSUME_NONNULL_END
