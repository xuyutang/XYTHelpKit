//
//  UIButton+ImgButton.m
//  sky_chatforoc
//
//  Created by xyt on 2022/10/11.
//

#import "UIButton+ImgButton.h"


@end
@implementation UIButton (ImgButton)



- (void)layoutWithType:(GHImagePosition)layoutType subMargin:(CGFloat)subMargin {
    self.layoutType = layoutType;
    self.subMargin = subMargin;
    [self setImagePosition:self.layoutType spacing:self.subMargin];
}
#pragma mark - Runtime Setter and getter
- (void)setLayoutType:(GHImagePosition)layoutType {
    if (self.layoutType == layoutType) {
        return;
    }
    objc_setAssociatedObject(self, @selector(layoutType),[NSNumber numberWithInteger:layoutType],OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self setNeedsLayout];
}

- (GHImagePosition)layoutType {
    NSNumber * result = objc_getAssociatedObject(self, @selector(layoutType));
    return [result integerValue];
}

- (void)setSubMargin:(CGFloat)subMargin {
    if (self.subMargin == subMargin) {
        return;
    }
    objc_setAssociatedObject(self, @selector(subMargin),[NSNumber numberWithFloat:subMargin],OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self setNeedsLayout];
}

- (CGFloat)subMargin {
    NSNumber * result = objc_getAssociatedObject(self, @selector(subMargin));
    return [result floatValue];
}
#pragma mark - Layout Methods

- (void)setImagePosition:(GHImagePosition)postion spacing:(CGFloat)spacing {
    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font constrainedToSize:self.frame.size].width;
 
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font constrainedToSize:self.frame.size].height;
#pragma clang diagnostic pop
 
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    switch (postion) {
        case GHImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case GHImagePositionRight:
    
                 self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
                   self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing/2), 0, imageWidth + spacing/2);
                self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
   
             break;
            
        case GHImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case GHImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
            
        default:
            break;
    }
    
}
@end
