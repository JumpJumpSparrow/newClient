//
//  FullImageTableViewCell.m
//  XinhuaNews
///Users/suning/Native_Flutter_Hybrid/XinhuaNews/Podfile
//  Created by suning on 2018/10/17.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "FullImageTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FullImageTableViewCell()

@property (nonatomic, strong) UIImageView *fullImageView;
@end

@implementation FullImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.fullImageView = [[UIImageView alloc] init];
    self.fullImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.fullImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.fullImageView];

    return self;
}

- (void)bindWithModel:(id)model {
    if (model == self.model) {
        return;
    }
    [super bindWithModel:model];
    
    NSString *url = (NSString *)model;
    [self.fullImageView sd_setImageWithURL:[NSURL URLWithString:url]
                          placeholderImage:[UIImage imageNamed:@"banner_placeholder"]];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.fullImageView.frame = self.contentView.bounds;
}


@end
