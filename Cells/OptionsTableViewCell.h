//
//  OptionsTableViewCell.h
//  XinhuaNews
//
//  Created by suning on 2018/10/12.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "BaseTableViewCell.h"

@class OptionsTableViewCell;

@protocol OptionsTableViewCellDelegate<NSObject>

- (void)optionsTableViewCell:(OptionsTableViewCell *)cell didSelectOption:(UIButton *)option;
@end

@interface OptionsTableViewCell : BaseTableViewCell

@property (nonatomic, weak) id <OptionsTableViewCellDelegate>delegate;
@end
