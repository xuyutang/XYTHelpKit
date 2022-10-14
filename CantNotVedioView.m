//
//  CantNotVedioView.m
//  sky_chatforoc
//
//  Created by xyt on 2022/10/13.
//

#import "CantNotVedioView.h"
#import "UIView+HLExtension.h"
#import "GradientLabel.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface CantNotVedioView()

/** 弹窗主内容view */
@property (nonatomic,strong) UIView   *contentView;

/** 弹窗标题 */
@property (nonatomic,copy)   NSString *title;

/** message */
@property (nonatomic,copy)   NSString *message;

/** 确认按钮 */
@property (nonatomic,copy)   UIButton *sureButton;

@end
@implementation CantNotVedioView


- (instancetype)initWithTittle:(NSString *)tittle message:(NSString *)message block:(void (^)(NSInteger))block{
    if (self = [super init]) {
        self.title = tittle;
        self.message = message;
        self.buttonBlock = block;
        [self sutUpView];
    }
    return self;
}

- (void)sutUpView{
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
//    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.85];
//    [UIView animateWithDuration:0.5 animations:^{
//        self.alpha = 1;
//    }];
    
    //------- 弹窗主内容 -------//
    self.contentView = [[UIView alloc]init];
    self.contentView.frame = CGRectMake(26, 0, SCREEN_WIDTH - 52, 300);
    self.contentView.center = self.center;
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#373636"];
    self.contentView.layer.cornerRadius = 5;
    [self addSubview:self.contentView];
    
 
    
    
    GradientLabel *titleLabel = [[GradientLabel alloc]initWithFrame:CGRectMake(0, 10, self.contentView.width, 22)];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.text = self.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel setGradientLabelColors:@[(__bridge id)[UIColor colorFromHexString:@"#FDCA38"].CGColor, (__bridge id)[UIColor colorFromHexString:@"#FF7D3A"].CGColor]];
    [self.contentView addSubview:titleLabel];
    
    // message
    UILabel *messageLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 78.5, self.contentView.width-20, 50)];
    messageLable.textColor = [UIColor whiteColor];
    messageLable.numberOfLines = 0;
    messageLable.font = [UIFont boldSystemFontOfSize:18];
    messageLable.textAlignment = NSTextAlignmentCenter;
    messageLable.text = self.message;
    [self.contentView addSubview:messageLable];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, messageLable.bottom + 50, self.contentView.width, 1)];
    line.backgroundColor = MAINCOLOR;
  
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame = CGRectMake(45, messageLable.bottom + 81, self.contentView.width - 90, 50);
    sureButton.backgroundColor = [UIColor redColor];
    [sureButton setTitle:@"Ok" forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(processSure:) forControlEvents:UIControlEventTouchUpInside];
  
    CAGradientLayer *layer2 = [CAGradientLayer layer];
    layer2.startPoint = CGPointMake(0, 0);//（0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
    layer2.endPoint = CGPointMake(0, 1);//（1，0）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
    layer2.colors = [NSArray arrayWithObjects:(id)[UIColor colorFromHexString:@"#FDCA38"].CGColor,(id)[UIColor colorFromHexString:@"#FF7D3A"].CGColor, nil];
    layer2.frame = sureButton.layer.bounds;
       [sureButton.layer insertSublayer:layer2 atIndex:0];
    [self.contentView addSubview:sureButton];

    
}




/**
 btnRect:按钮的frame
 borderWidth:按钮的边框宽度
 默认圆角为高度的1/2，修改圆角需要修改gradientLayer和whiteView的cornerRadius
 */
- (UIImage *)getImageWithFrame:(CGRect)btnRect withBorderWidth:(CGFloat)borderWidth{
    CGFloat btnWidth = btnRect.size.width;
    CGFloat btnHeight = btnRect.size.height;
    //用来放置渐变色的view
    UIView *crView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, btnWidth, btnHeight)];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)MAINCOLOR.CGColor, (__bridge id)[UIColor colorFromHexString:@"ffaa60"].CGColor];
    gradientLayer.locations = @[@0.3, @0.7];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, crView.frame.size.width, crView.frame.size.height);
    gradientLayer.cornerRadius = btnHeight*1.0/2;
    [crView.layer addSublayer:gradientLayer];
    //空白view
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(borderWidth, borderWidth, btnWidth-borderWidth*2, btnHeight-borderWidth*2)];
    whiteView.layer.cornerRadius = btnHeight*1.0/2;
    whiteView.backgroundColor = [UIColor whiteColor];
    [crView addSubview:whiteView];
    //把配置好的view转变成image
    CGSize s = CGSizeMake(btnWidth, btnHeight);
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [crView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}


- (void)show{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}


- (void)processSure:(UIButton *)sender{
    if (self.buttonBlock) {
        self.buttonBlock(VedioBlockSureButtonClick);
    }
    [self dismiss];
}

- (void)causeBtn:(UIButton *)sender{
    if (self.buttonBlock) {
        self.buttonBlock(VediotBlockCauseButtonClick);
    }
    [self dismiss];
}

#pragma mark - 移除此弹窗
/** 移除此弹窗 */
- (void)dismiss{
    [self removeFromSuperview];
}
@end

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

