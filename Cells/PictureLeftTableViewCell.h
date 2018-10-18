//
//  PictureLeftTableViewCell.h
//  XinhuaNews
//
//  Created by suning on 2018/10/17.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface PictureLeftTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *timesLabel;
@property (nonatomic, strong) UILabel *mediaLabel;

@end
