//
//  DoubleImageTableViewCell.h
//  XinhuaNews
//
//  Created by suning on 2018/10/17.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "BaseTableViewCell.h"

@class TitleButton;
@class DoubleImageTableViewCell;

@protocol DoubleImageTableViewCellDelegate<NSObject>

- (void)doubleImageTableViewCell:(DoubleImageTableViewCell *)cell didSelectButton:(TitleButton *)button;
@end

@interface TitleButton:UIButton

@property (nonatomic, strong) UIImageView *newsImageView;
@property (nonatomic, strong) UILabel *newsTitle;
@end

@interface DoubleImageTableViewCell : BaseTableViewCell

@property (nonatomic, weak) id <DoubleImageTableViewCellDelegate>delegate;
@end
