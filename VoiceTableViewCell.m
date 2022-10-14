//
//  VoiceTableViewCell.m
//  sky_chatforoc
//
//  Created by xyt on 2022/10/13.
//

#import "VoiceTableViewCell.h"
#import "UIButton+ImgButton.h"


@end
@implementation VoiceTableViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 12;
        self.layer.borderWidth = 2;
        self.layer.borderColor = [UIColor colorFromHexString:@"#FF7D3A"].CGColor;
        
    }
    return self;
}
- (void)updateData:(id)data indexPath:(NSIndexPath *)indexPath{
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:data[@"icon"]] placeholderImage:nil];
}

- (UIImageView *)iconImgView {
    _iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.width, self.contentView.height)];
    _iconImgView.layer.masksToBounds = YES;
    _iconImgView.layer.cornerRadius = 8;
    _iconImgView.contentMode = 2;
    [self.contentView addSubview:_iconImgView];
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(33, 67, self.contentView.width - 66, 50)];
    img.image = [UIImage imageNamed:@"musicwav"];
    [_iconImgView addSubview:img];
    
    UIButton * causeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    causeBtn.frame = CGRectMake(30, 158, 100, 32);
    [causeBtn setTitle:@"Call" forState:UIControlStateNormal];
    [causeBtn setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
    [causeBtn addTarget:self action:@selector(causeBtn:) forControlEvents:UIControlEventTouchUpInside];
    causeBtn.layer.masksToBounds = YES;
    causeBtn.layer.cornerRadius = 15;
    [causeBtn layoutWithType:GHImagePositionLeft subMargin:10.f];
    [causeBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 62)];
    CAGradientLayer *layer = [CAGradientLayer layer];
       layer.startPoint = CGPointMake(0, 0);//（0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
       layer.endPoint = CGPointMake(0, 1);//（1，1）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
       layer.colors = [NSArray arrayWithObjects:(id)[UIColor colorFromHexString:@"#FACC48"].CGColor,(id)[UIColor colorFromHexString:@"#FA8448"].CGColor, nil];
   

       layer.frame = causeBtn.layer.bounds;
       [causeBtn.layer insertSublayer:layer atIndex:0];
    [self.contentView addSubview:causeBtn];
    
    return _iconImgView;
}

-(void)causeBtn:(id)sender {
    _CantNotView = [[CantNotVedioView alloc] initWithTittle:@"Tips" message:@"Sorry, Tom is not online and can't start a Call." block:^(NSInteger index) {
        
    }];
    [_CantNotView show];
}
    




@end
