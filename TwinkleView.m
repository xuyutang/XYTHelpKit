//
//  TwinkleView.m

//  Created by xyt on 2022/10/11.
//

#import "TwinkleView.h"

const static CGFloat WIDTH = 80;
const static CGFloat HEIGHT = 20;
const static CGFloat padding = 5;
const static CGFloat DOT_WIDTH = 10;

const static CGFloat TimeLabelHeight = 21;
const static CGFloat TimeLabelWidth = 70;


@interface TwinkleView()

@property (nonatomic,strong) UIView *dot;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIWindow *window;

@property (nonatomic,assign) BOOL isAnimating;
@property (nonatomic,strong) UIView *backgroundView;


@end

/// 倒计时总秒数
static NSInteger CountdownSeconds = 5;

@implementation TwinkleView
{
    HSTwinkleCountdownBlock _countdownBlock;
}

+ (instancetype)sharedInstance {
    static TwinkleView *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [TwinkleView new];
    });
    return _instance;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)init{
    self = [super init];
    if (self) {
        _startDate = [NSDate date];
        //定时器记录获取验证码的时间
        _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(resetTime:) userInfo:nil repeats:YES];
        [_timer setFireDate:[NSDate distantFuture]];
        id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
        if ([delegate respondsToSelector:@selector(window)])
            self.window = [delegate performSelector:@selector(window)];
        else self.window = [[UIApplication sharedApplication] keyWindow];
        
        [self setUpView];
        self.bounds = CGRectMake(0, 0, DOT_WIDTH + TimeLabelWidth + 10, HEIGHT);
    }
    return self;
}

- (void)recover{
   
    
    _startDate = [NSDate date];
    [_timer setFireDate:[NSDate date]];
//    [_timer setFireDate:[NSDate distantPast]];//运行`

    _dot.hidden = NO;

    _timeLabel.font = [UIFont systemFontOfSize:12.0];
//    _timeLabel.center = CGPointMake(self.center.x + 5, self.center.y);

    _timeLabel.layer.masksToBounds = YES;
    _timeLabel.layer.cornerRadius = 10.5;

    _timeLabel.textAlignment = NSTextAlignmentCenter;
    
    
   
}
- (void)reset{
    _startDate = [NSDate date];
    [_timer setFireDate:[NSDate distantFuture]];
    
    _dot.hidden = NO;
    
    _timeLabel.font = [UIFont systemFontOfSize:12.0];
//    _timeLabel.center = CGPointMake(self.center.x + 5, self.center.y);
   
    _timeLabel.layer.masksToBounds = YES;
    _timeLabel.layer.cornerRadius = 10.5;
    
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    
}
- (void)userForCat{
    
    _dot.hidden = YES;
    
    _timeLabel.font = [UIFont systemFontOfSize:15.0];
    
    _timeLabel.frame = CGRectMake(padding, _dot.frame.origin.y, TimeLabelWidth, TimeLabelHeight);

    _timeLabel.textAlignment = NSTextAlignmentCenter;
    
}

-(void)start {
    if(!self.startingBool){
        [self startAnimation];
    }
  
    
}

- (void)setUpView{
    if (_timeLabel) {
        [_timeLabel removeFromSuperview];
    }
    self.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    _backgroundView = [[UIView alloc]initWithFrame:self.frame];
//    这里为什么屏蔽，是因为视频播放是横竖屏转化不规则导致视图显示出问题，暂时把背景去掉
    //_backgroundView.layer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.2].CGColor;
    _backgroundView.layer.cornerRadius = 2;
    [self addSubview:_backgroundView];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.bounds = CGRectMake(0, 0, TimeLabelWidth, TimeLabelHeight);
    _timeLabel.text = @"00:00";
    _timeLabel.font = [UIFont systemFontOfSize:12.0];
    _timeLabel.textColor = [UIColor whiteColor];
    _timeLabel.center = CGPointMake(_timeLabel.center.x + 5, self.center.y);
    [self addSubview:_timeLabel];
    
//    _dot = [[UIView alloc]init];
//    _dot.bounds = CGRectMake(0, 0, DOT_WIDTH, DOT_WIDTH);
//    _dot.center = CGPointMake(CGRectGetMinX(_timeLabel.frame) - 5 - DOT_WIDTH * 0.5, self.center.x);
//    _dot.layer.cornerRadius = DOT_WIDTH/2;
//    _dot.layer.backgroundColor = [UIColor redColor].CGColor;
//    [self addSubview:_dot];
//
}

- (void)showAtLocation:(CGPoint)origin inView:(UIView *)view{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(origin.x, origin.y, width, height);;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.superview) {
            [self removeFromSuperview];
        }
        if (view) {
            [view addSubview:self];
        }
        else{
           [self.window addSubview:self];
        }
       // [self startAnimation];
    });
}

- (void)hide{
//    if (!self.isAnimating) {
//        return;
//    }
//    self.isAnimating = FALSE;
    [self.dot.layer removeAllAnimations];
    [_timer setFireDate:[NSDate distantFuture]];
    [self removeFromSuperview];
}

- (void)startAnimation{
//    if (self.isAnimating) {
//        return;
//    }
    [_timer setFireDate:[NSDate distantPast]];
    //self.isAnimating = YES;
//    [self.dot.layer addAnimation:[self opacityForever_Animation:1.0f] forKey:nil];
}

- (void)countdown:(HSTwinkleCountdownBlock)countdownBlock {
    CountdownSeconds = 5;
    _countdownBlock = countdownBlock;
}
    

- (void)resetTime:(NSTimer *)timer{
    NSDate *now = [NSDate date];
    NSTimeInterval interval = [now timeIntervalSinceDate:_startDate];

    dispatch_async(dispatch_get_main_queue(), ^{
        if (CountdownSeconds >= 0) {
            !self->_countdownBlock?:self->_countdownBlock(CountdownSeconds);
            CountdownSeconds--;
            if (CountdownSeconds < 0) {
                if (self->_countdownBlock) {
                    self->_countdownBlock = nil;
                }
            }
        }
        NSString *time = [self convertTime:interval];

//        CGFloat width = [time boundingRectWithSize:self.bounds.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0]} context:nil].size.width + 10;
//        CGRect frame = CGRectMake((self.width - width) / 2, 0, width, TimeLabelHeight);
//        self.timeLabel.frame = frame;
//        self.dot.center = CGPointMake(CGRectGetMinX(self.timeLabel.frame) - 5 - DOT_WIDTH * 0.5, CGRectGetMidY(self.timeLabel.frame));
//
        self.timeLabel.text = time;
        if (self.superview) {
            [self.superview bringSubviewToFront:self];
        }
    });
    
}

- (NSString *)convertTime:(NSTimeInterval) interval{
    
    NSInteger hour = ((NSInteger)interval)/3600;
    NSInteger minute = ((NSInteger)(interval - 3600*hour))/60;
    NSInteger second = (NSInteger)interval - hour*3600 - minute * 60;
    if (hour <= 0) {
        return [NSString stringWithFormat:@"%02zd:%02zd", minute, second];
    }
    return [NSString stringWithFormat:@"%02zd:%02zd:%02zd",hour%60,minute,second];
}

-(CABasicAnimation *)opacityForever_Animation:(float)time
{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];//必须写opacity才行。
    
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    
    animation.toValue = [NSNumber numberWithFloat:0.0f];//这是透明度。
    
    animation.autoreverses = YES;
    
    animation.duration = time;
    
    animation.repeatCount = MAXFLOAT;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];///没有的话是均匀的动画。
    
    return animation;
    
}

-(BOOL)beforeSaveJudge{

    NSDate *now = [NSDate date];
    NSTimeInterval interval = [now timeIntervalSinceDate:_startDate];
    if (interval<5.1) {
        
        return NO;
        
    }else{
    
        return YES;
    }
}

-(void)invoid {
    [_timer invalidate];
    _timer = nil;
    
}
@end
