//
//  MMPlaceholderTextView.h
//  imssee
//
//  Created by subai on 16/1/8.
//  Copyright © 2016年 鑫易. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  带默认提示的textView
 */


@class MMPlaceholderTextView;

@interface MMPlaceholderTextView : UITextView<UITextViewDelegate>

@property (copy, nonatomic) NSString *placeholder;
@property (assign, nonatomic) NSInteger maxLength;//最大长度
@property (strong, nonatomic) UILabel *placeholderLabel;
@property (strong, nonatomic) UILabel *wordNumLabel;

//文字输入
@property (copy, nonatomic) void(^didChangeText)(MMPlaceholderTextView *textView);
- (void)didChangeText:(void(^)(MMPlaceholderTextView *textView))block;

@end
