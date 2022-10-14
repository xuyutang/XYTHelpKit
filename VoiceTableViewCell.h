//
//  VoiceTableViewCell.h
//  sky_chatforoc
//
//  Created by xyt on 2022/10/13.
//

#import <UIKit/UIKit.h>
#import "CantNotVedioView.h"
NS_ASSUME_NONNULL_BEGIN

@interface VoiceTableViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *iconImgView;
@property(nonatomic,strong) CantNotVedioView * CantNotView;
@end

NS_ASSUME_NONNULL_END
