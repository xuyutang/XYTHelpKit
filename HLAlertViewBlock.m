//
//  ViewController.m
//  sky_chatforoc
//
//  Created by xyt on 2022/10/10.
//
//#import "UIButton+ImgButton.h"
#import "HLAlertViewBlock.h"
#import "UIView+HLExtension.h"
#import "UIButton+ImgButton.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@end
@interface HLAlertViewBlock()<UITableViewDelegate,UITableViewDataSource>

/** 弹窗主内容view */
@property (nonatomic,strong) UIView   *contentView;

/** 弹窗标题 */
@property (nonatomic,copy)   NSString *title;

/** message */
@property (nonatomic,copy)   NSString *message;

/** 确认按钮 */
@property (nonatomic,copy)   UIButton *sureButton;


@property (nonatomic,copy)   NSDictionary *dic;

@property (nonatomic,strong) UITableView *menuTab;


@end


@implementation HLAlertViewBlock

- (instancetype)initWithTittle:(NSString *)tittle message:(NSString *)message dic:(NSDictionary*)dic block:(void (^) (NSInteger index))block{
    if (self = [super init]) {
        self.title = tittle;
        self.message = message;
        self.buttonBlock = block;
        self.dic = dic;
        [self sutUpView];
    }
    return self;
}


-(void)deleteClick:(void (^)())block{
    self.deleteBlock = block;
}
-(void)report:(void (^)())block {
    self.reportBlock = block;
}
-(void)playWithBlock:(void (^) (NSDictionary* dic))block {
    
    self.playBlock = block;
}

-(void)stop:(void (^)())block {
    self.stopBlock = block;
    
}

-(void)play {
    self.playBlock(self.dic);
    _playimgView.hidden = NO;
    _playBtn.hidden = YES;
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
    
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(23, 15, 24, 24);
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:closeBtn];
    
    
    UIButton *warnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    warnBtn.frame = CGRectMake(self.contentView.width - 24-23, 15, 24, 24);
    [warnBtn setImage:[UIImage imageNamed:@"warn"] forState:UIControlStateNormal];
    [warnBtn addTarget:self action:@selector(menuPop) forControlEvents:UIControlEventTouchUpInside];

    [self.contentView addSubview:warnBtn];
//    // 标题
//    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, self.contentView.width, 22)];
//    titleLabel.font = [UIFont boldSystemFontOfSize:20];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.text = self.title;
//    [self.contentView addSubview:titleLabel];
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake((self.contentView.width-179.21)/2, 68, 179.21, 179.21)];
    view.backgroundColor =  [UIColor colorFromHexString:@"#5f5e5e"];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 179.21/2;
    view.layer.borderWidth = 1;
    view.layer.borderColor = [UIColor colorFromHexString:@"#8b8a8a"].CGColor;
    [self.contentView addSubview:view];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((view.width - 155.47)/2, (view.height - 155.47)/2, 155.47, 155.47)];
    [imgView setImageWithURL:[NSURL URLWithString:self.dic[@"icon"]] placeholder:nil];
    imgView.layer.masksToBounds = YES;
    imgView.contentMode = 2;
    imgView.layer.cornerRadius = 155.47/2;
    imgView.userInteractionEnabled = YES;

    
    [view addSubview:imgView];
    
    
    
    _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _playBtn.frame = CGRectMake((imgView.width-18)/2, (imgView.height-23)/2, 18 ,23);
    [_playBtn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [_playBtn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];

    [imgView addSubview:_playBtn];

  _playimgView = [[UIImageView alloc] initWithFrame:CGRectMake(17, 55, 121, 53)];
   

 NSArray * imgsArr = @[[UIImage imageNamed:@"voicewav_00001"],[UIImage imageNamed:@"voicewav_00002"],[UIImage imageNamed:@"voicewav_00003"],[UIImage imageNamed:@"voicewav_00004"],[UIImage imageNamed:@"voicewav_00005"],[UIImage imageNamed:@"voicewav_00006"],[UIImage imageNamed:@"voicewav_00007"],[UIImage imageNamed:@"voicewav_00008"],[UIImage imageNamed:@"voicewav_00009"],[UIImage imageNamed:@"voicewav_00010"],[UIImage imageNamed:@"voicewav_00011"],[UIImage imageNamed:@"voicewav_00012"],[UIImage imageNamed:@"voicewav_00013"],[UIImage imageNamed:@"voicewav_00014"],[UIImage imageNamed:@"voicewav_00015"],[UIImage imageNamed:@"voicewav_00016"],[UIImage imageNamed:@"voicewav_00017"],[UIImage imageNamed:@"voicewav_00018"],[UIImage imageNamed:@"voicewav_00019"],[UIImage imageNamed:@"voicewav_00020"],[UIImage imageNamed:@"voicewav_00021"],[UIImage imageNamed:@"voicewav_00022"],[UIImage imageNamed:@"voicewav_00023"],[UIImage imageNamed:@"voicewav_00024"],[UIImage imageNamed:@"voicewav_00025"],[UIImage imageNamed:@"voicewav_00026"],[UIImage imageNamed:@"voicewav_00027"],[UIImage imageNamed:@"voicewav_00028"],[UIImage imageNamed:@"voicewav_00029"],[UIImage imageNamed:@"voicewav_00030"],[UIImage imageNamed:@"voicewav_00031"],[UIImage imageNamed:@"voicewav_00032"],[UIImage imageNamed:@"voicewav_00033"],[UIImage imageNamed:@"voicewav_00034"],[UIImage imageNamed:@"voicewav_00035"],[UIImage imageNamed:@"voicewav_00036"],[UIImage imageNamed:@"voicewav_00037"],[UIImage imageNamed:@"voicewav_00038"],[UIImage imageNamed:@"voicewav_00039"],[UIImage imageNamed:@"voicewav_00040"],[UIImage imageNamed:@"voicewav_00041"],[UIImage imageNamed:@"voicewav_00042"],[UIImage imageNamed:@"voicewav_00043"],[UIImage imageNamed:@"voicewav_00044"],[UIImage imageNamed:@"voicewav_00045"],[UIImage imageNamed:@"voicewav_00046"],[UIImage imageNamed:@"voicewav_00047"],[UIImage imageNamed:@"voicewav_00048"],[UIImage imageNamed:@"voicewav_00049"],[UIImage imageNamed:@"voicewav_00050"],[UIImage imageNamed:@"voicewav_00051"],[UIImage imageNamed:@"voicewav_00052"],[UIImage imageNamed:@"voicewav_00053"],[UIImage imageNamed:@"voicewav_00054"],[UIImage imageNamed:@"voicewav_00055"],[UIImage imageNamed:@"voicewav_00056"],[UIImage imageNamed:@"voicewav_00057"],[UIImage imageNamed:@"voicewav_00058"],[UIImage imageNamed:@"voicewav_00059"]];
    _playimgView.hidden = YES;
       [_playimgView setAnimationImages:imgsArr];
       [_playimgView setAnimationDuration:2];//设置时间
    _playimgView.animationRepeatCount = 130;//设置次数
       [_playimgView startAnimating];//开始执行
        [imgView addSubview:_playimgView];
    
      


    
    // message
    UILabel *messageLable = [[UILabel alloc]initWithFrame:CGRectMake(10, view.bottom +39, self.contentView.width-20, 50)];
    messageLable.textColor = [UIColor whiteColor];
    messageLable.numberOfLines = 0;
    messageLable.font = [UIFont boldSystemFontOfSize:18];
    messageLable.textAlignment = NSTextAlignmentCenter;
    messageLable.text = [NSString stringWithFormat:@"Click listen %@’s v",self.dic[@"name"]];
    [self.contentView addSubview:messageLable];
    

    
    
    // 取消按钮
    UIButton * causeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    causeBtn.frame = CGRectMake(22, self.contentView.height - 75, self.contentView.width/2 - 32, 50);
    [causeBtn setTitle:@"video" forState:UIControlStateNormal];
    [causeBtn setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
    [causeBtn addTarget:self action:@selector(causeBtn:) forControlEvents:UIControlEventTouchUpInside];
    causeBtn.layer.masksToBounds = YES;
    causeBtn.layer.cornerRadius = 5;
    [causeBtn layoutWithType:GHImagePositionLeft subMargin:10.f];
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
    [sureButton setTitle:@"message" forState:UIControlStateNormal];
    [sureButton setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [sureButton layoutWithType:GHImagePositionLeft subMargin:10.f];

    [sureButton addTarget:self action:@selector(processSure:) forControlEvents:UIControlEventTouchUpInside];
    CAGradientLayer *layer2 = [CAGradientLayer layer];
    layer2.startPoint = CGPointMake(0, 0);//（0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
    layer2.endPoint = CGPointMake(0, 1);//（1，1）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
    layer2.colors = [NSArray arrayWithObjects:(id)[UIColor colorFromHexString:@"#FACC48"].CGColor,(id)[UIColor colorFromHexString:@"#FA8448"].CGColor, nil];
   

    layer2.frame = sureButton.layer.bounds;
    
    sureButton.layer.masksToBounds = YES;
    sureButton.layer.cornerRadius = 5;
  
//    sureButton.layer.borderColor = MAINCOLOR.CGColor;
//    [sureButton setBackgroundImage:[UIImage imageNamed:@"btnbord"] forState:UIControlStateNormal];
    [sureButton.layer insertSublayer:layer2 atIndex:0];

    [self.contentView addSubview:sureButton];
    
}

-(void)menuPop {
    _menuTab = [[UITableView alloc]initWithFrame:CGRectMake(self.contentView.width -70, 45,75, 120) style:UITableViewStylePlain];
//    // 清空背景颜色
    
    _menuTab.backgroundColor = [UIColor clearColor];

//
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:_menuTab.bounds] ;
        [imageview setImage:[UIImage imageNamed:@"menu"]];
    _menuTab.delegate =self;
    _menuTab.dataSource = self;
    _menuTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_menuTab setBackgroundView:imageview];

    [self.contentView addSubview:_menuTab];
  
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view =[[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 10;;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *arr = @[@"Block",@"Delete",@"Report",@"Cancel"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    if (@available(iOS 15.0, *)) {
              tableView.sectionHeaderTopPadding = 0;
          }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textAlignment = 1;
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.text = arr[indexPath.row];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 28;;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_menuTab removeFromSuperview];
    switch (indexPath.row) {
        case 0:
           //Block
        self.deleteBlock(self.dic);
            break;
        case 1:
            //Delete
            self.deleteBlock(self.dic);
            break;
        case 2:
            //Report
            self.reportBlock();
            break;
        case 3:
            //Cancel
            break;
            
        default:
            break;
    }
    
  
    
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
        self.buttonBlock(AlertBlockSureButtonClick);
    }
    [self dismiss];
}

- (void)causeBtn:(UIButton *)sender{
    if (self.buttonBlock) {
        self.buttonBlock(AlertBlockCauseButtonClick);
    }
   // [self dismiss];
}



#pragma mark - 移除此弹窗
/** 移除此弹窗 */
- (void)dismiss{
    [self removeFromSuperview];
}

/** 移除此弹窗 */
- (void)close{
    self.stopBlock();
    [self removeFromSuperview];
    
    
}

@end
