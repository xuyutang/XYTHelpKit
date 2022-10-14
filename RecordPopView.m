//
//  RecordPopView.m
//  sky_chatforoc
//
//  Created by xyt on 2022/10/11.
//

#import "RecordPopView.h"

#import "UIView+HLExtension.h"
#import "TwinkleView.h"
#import "GradientLabel.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface RecordPopView()



/** 弹窗标题 */
@property (nonatomic,copy)   NSString *title;

/** message */
@property (nonatomic,copy)   NSString *message;

/** 确认按钮 */
@property (nonatomic,copy)   UIButton *sureButton;

@end


@implementation RecordPopView

- (instancetype)initWithTittle:(NSString *)tittle message:(NSString *)message block:(void (^)(NSInteger))block{
    if (self = [super init]) {
        self.title = tittle;
        self.message = message;
        self.buttonBlock = block;
        [self sutUpView];
    }
    return self;
}
-(void)record:(void (^)())block{
    self.recordBlock = block;
    
}
- (void)sutUpView{
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
//    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.85];
//    [UIView animateWithDuration:0.5 animations:^{
//        self.alpha = 1;
//    }];
    
    //------- 弹窗主内容 -------//
    self.contentView = [[UIView alloc]init];
    self.contentView.frame = CGRectMake(26, 0, SCREEN_WIDTH - 52, 430);
    self.contentView.center = self.center;
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#373636"];
    self.contentView.layer.cornerRadius = 5;
    [self addSubview:self.contentView];
    

    
    GradientLabel *titleLabel = [[GradientLabel alloc]initWithFrame:CGRectMake(0, 24, self.contentView.width, 22)];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.text = @"Send voice";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel setGradientLabelColors:@[(__bridge id)[UIColor colorFromHexString:@"#FDCA38"].CGColor, (__bridge id)[UIColor colorFromHexString:@"#FF7D3A"].CGColor]];
    [self.contentView addSubview:titleLabel];
    
    
    _playimgView = [[UIImageView alloc] initWithFrame:CGRectMake((self.contentView.width -121)/2, titleLabel.bottom + 70, 121, 53)];
     

   NSArray * imgsArr = @[[UIImage imageNamed:@"voicewav_00001"],[UIImage imageNamed:@"voicewav_00002"],[UIImage imageNamed:@"voicewav_00003"],[UIImage imageNamed:@"voicewav_00004"],[UIImage imageNamed:@"voicewav_00005"],[UIImage imageNamed:@"voicewav_00006"],[UIImage imageNamed:@"voicewav_00007"],[UIImage imageNamed:@"voicewav_00008"],[UIImage imageNamed:@"voicewav_00009"],[UIImage imageNamed:@"voicewav_00010"],[UIImage imageNamed:@"voicewav_00011"],[UIImage imageNamed:@"voicewav_00012"],[UIImage imageNamed:@"voicewav_00013"],[UIImage imageNamed:@"voicewav_00014"],[UIImage imageNamed:@"voicewav_00015"],[UIImage imageNamed:@"voicewav_00016"],[UIImage imageNamed:@"voicewav_00017"],[UIImage imageNamed:@"voicewav_00018"],[UIImage imageNamed:@"voicewav_00019"],[UIImage imageNamed:@"voicewav_00020"],[UIImage imageNamed:@"voicewav_00021"],[UIImage imageNamed:@"voicewav_00022"],[UIImage imageNamed:@"voicewav_00023"],[UIImage imageNamed:@"voicewav_00024"],[UIImage imageNamed:@"voicewav_00025"],[UIImage imageNamed:@"voicewav_00026"],[UIImage imageNamed:@"voicewav_00027"],[UIImage imageNamed:@"voicewav_00028"],[UIImage imageNamed:@"voicewav_00029"],[UIImage imageNamed:@"voicewav_00030"],[UIImage imageNamed:@"voicewav_00031"],[UIImage imageNamed:@"voicewav_00032"],[UIImage imageNamed:@"voicewav_00033"],[UIImage imageNamed:@"voicewav_00034"],[UIImage imageNamed:@"voicewav_00035"],[UIImage imageNamed:@"voicewav_00036"],[UIImage imageNamed:@"voicewav_00037"],[UIImage imageNamed:@"voicewav_00038"],[UIImage imageNamed:@"voicewav_00039"],[UIImage imageNamed:@"voicewav_00040"],[UIImage imageNamed:@"voicewav_00041"],[UIImage imageNamed:@"voicewav_00042"],[UIImage imageNamed:@"voicewav_00043"],[UIImage imageNamed:@"voicewav_00044"],[UIImage imageNamed:@"voicewav_00045"],[UIImage imageNamed:@"voicewav_00046"],[UIImage imageNamed:@"voicewav_00047"],[UIImage imageNamed:@"voicewav_00048"],[UIImage imageNamed:@"voicewav_00049"],[UIImage imageNamed:@"voicewav_00050"],[UIImage imageNamed:@"voicewav_00051"],[UIImage imageNamed:@"voicewav_00052"],[UIImage imageNamed:@"voicewav_00053"],[UIImage imageNamed:@"voicewav_00054"],[UIImage imageNamed:@"voicewav_00055"],[UIImage imageNamed:@"voicewav_00056"],[UIImage imageNamed:@"voicewav_00057"],[UIImage imageNamed:@"voicewav_00058"],[UIImage imageNamed:@"voicewav_00059"]];
      _playimgView.hidden = YES;
         [_playimgView setAnimationImages:imgsArr];
         [_playimgView setAnimationDuration:2];//设置时间
      _playimgView.animationRepeatCount = 130;//设置次数
         [_playimgView startAnimating];//开始执行
      
      
    // mkphone
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(105, 84, 113, 113)];
    view.backgroundColor =  [UIColor colorWithHexString:@"#373636"];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 113/2;
    view.layer.borderWidth = 2;
    view.layer.borderColor = [UIColor colorFromHexString:@"#4C4640"].CGColor;
    [self.contentView addSubview:view];
     _mkpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _mkpButton.frame = CGRectMake(17, 17, 80 , 80);
    [_mkpButton setImage:[UIImage imageNamed:@"mkphone"] forState:UIControlStateNormal];
    [_mkpButton addTarget:self action:@selector(speak) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_mkpButton];



    
    [[TwinkleView sharedInstance] showAtLocation:CGPointMake((self.contentView.width -10)/2, view.bottom + 30) inView:self.contentView];
    
    [[TwinkleView sharedInstance] reset];

    
    // message
    UILabel *messageLable = [[UILabel alloc]initWithFrame:CGRectMake(24, view.bottom +42 +19, self.contentView.width-48, 63)];
    messageLable.textColor = [UIColor whiteColor];
    messageLable.numberOfLines = 0;
    messageLable.font = [UIFont boldSystemFontOfSize:15];
    messageLable.textAlignment = NSTextAlignmentCenter;
    messageLable.text = @"Say something interesting or sing a song.If someone is interested in your voice, you can video chat. ";
    [self.contentView addSubview:messageLable];
    
 
    
    // 取消按钮
    UIButton * causeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    causeBtn.frame = CGRectMake(22, self.contentView.height - 75, self.contentView.width/2 - 32, 50);
    [causeBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [causeBtn addTarget:self action:@selector(causeBtn:) forControlEvents:UIControlEventTouchUpInside];
    causeBtn.layer.masksToBounds = YES;
    causeBtn.layer.cornerRadius = 5;
    CAGradientLayer *layer = [CAGradientLayer layer];
       layer.startPoint = CGPointMake(0, 0);//（0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
       layer.endPoint = CGPointMake(0, 1);//（1，1）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
       layer.colors = [NSArray arrayWithObjects:(id)[UIColor colorFromHexString:@"#FACC48"].CGColor,(id)[UIColor colorFromHexString:@"#FA8448"].CGColor, nil];
   

       layer.frame = causeBtn.layer.bounds;
       [causeBtn.layer insertSublayer:layer atIndex:0];
    [self.contentView addSubview:causeBtn];
    
    // 确认按钮
    UIButton * sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame = CGRectMake(self.contentView.width/2 + 20, causeBtn.y, causeBtn.width , 50);
    [sureButton setTitle:@"Send" forState:UIControlStateNormal];

    [sureButton addTarget:self action:@selector(processSure:) forControlEvents:UIControlEventTouchUpInside];
    CAGradientLayer *layer2 = [CAGradientLayer layer];
    layer2.startPoint = CGPointMake(0, 0);//（0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
    layer2.endPoint = CGPointMake(0, 1);//（1，1）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
    layer2.colors = [NSArray arrayWithObjects:(id)[UIColor colorFromHexString:@"#FACC48"].CGColor,(id)[UIColor colorFromHexString:@"#FA8448"].CGColor, nil];
   

    layer2.frame = sureButton.layer.bounds;
    
    sureButton.layer.masksToBounds = YES;
    sureButton.layer.cornerRadius = 5;
  

    [sureButton.layer insertSublayer:layer2 atIndex:0];

    [self.contentView addSubview:sureButton];
    [self.contentView addSubview:_playimgView];
    
}

-(void)speak {
    if(!_isfinishRecord){
        [[TwinkleView sharedInstance] start];
      //  _isfinishRecord = !_isfinishRecord;


    }
    self.recordBlock();
    
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
        self.buttonBlock(PopBlockSureButtonClick);
    }
    [self dismiss];
}

- (void)causeBtn:(UIButton *)sender{
    if (self.buttonBlock) {
        self.buttonBlock(PopBlockCauseButtonClick);
    }
    [self dismiss];
}

#pragma mark - 移除此弹窗
/** 移除此弹窗 */
- (void)dismiss{
    [self removeFromSuperview];
}
@end

