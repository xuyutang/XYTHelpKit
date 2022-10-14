//
//  MyimgView.m
//  sky_chatforoc
//
//  Created by xyt on 2022/10/13.
//

#import "MyimgView.h"

@implementation MyimgView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint newPoint = [self convertPoint:point toView:self.childrenBtn];

         if ([self.childrenBtn pointInside:newPoint withEvent:event]) {

             return self.childrenBtn;

         }

         return [super hitTest:point withEvent:event];

    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
