//
//  PictureLeftTableViewCell.m
//  XinhuaNews
//
//  Created by suning on 2018/10/17.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "PictureLeftTableViewCell.h"
#import "BaseNewsModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation PictureLeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.isShowLine = YES;
    [self.contentView addSubview:self.coverImageView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.timesLabel];
    [self.coverImageView addSubview:self.mediaLabel];
    self.textLabel.numberOfLines = 0;
    self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    self.textLabel.textColor = [UIColor blackColor];
    return self;
}

- (void)bindWithModel:(id)model {
    if (model == self.model) {
        return;
    }
    [super bindWithModel:model];
    
    BaseNewsModel *news = (BaseNewsModel *)model;
    
    self.timesLabel.text = [NSString stringWithFormat:@"%ld阅", news.readCount];
    self.timeLabel.text = news.releaseime;
    self.textLabel.text = news.title;
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:news.coverImageUrl]
                           placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.mediaLabel.text = news.duration;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.coverImageView.frame = CGRectMake(10, 10, self.frame.size.height , self.frame.size.height - 20);
    
    CGSize size = [self.textLabel sizeThatFits:CGSizeMake(self.contentView.width - self.coverImageView.right - 15, self.contentView.height - 30)];
    self.textLabel.frame = CGRectMake(self.coverImageView.right + 10, 10, size.width, size.height);
    
    size = [self.timeLabel sizeThatFits:CGSizeMake(100, 40)];
    self.timeLabel.frame = CGRectMake(self.coverImageView.right + 10, self.coverImageView.bottom - size.height ,size.width, size.height);
    
    size = [self.timesLabel sizeThatFits:CGSizeMake(100, 40)];
    self.timesLabel.frame = CGRectMake(self.contentView.width - 10 - size.width, self.coverImageView.bottom - 10, size.width, size.height);
    
    size = [self.mediaLabel sizeThatFits:CGSizeMake(60, 30)];
    size.width += 5;
    size.height += 5;
    self.mediaLabel.frame = CGRectMake(self.coverImageView.width - size.width - size.height - 5, self.coverImageView.height - size.height - 5, size.width + size.height, size.height);
    self.mediaLabel.layer.cornerRadius = size.height/2;
    self.mediaLabel.clipsToBounds = YES;
}

- (UIImageView *)coverImageView {
    
    if (_coverImageView == nil) {
        _coverImageView = [[UIImageView alloc] init];
        _coverImageView.clipsToBounds = YES;
        _coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _coverImageView;
}

- (UILabel *)timesLabel {
    if (_timesLabel == nil) {
        _timesLabel = [[UILabel alloc] init];
        _timesLabel.font = [UIFont systemFontOfSize:11.0f];
        _timesLabel.textColor = [UIColor lightGrayColor];
    }
    return _timesLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:11.0f];
        _timeLabel.textColor = [UIColor lightGrayColor];
    }
    return _timeLabel;
}

- (UILabel *)mediaLabel {
    
    if (_mediaLabel == nil) {
        _mediaLabel = [[UILabel alloc] init];
        _mediaLabel.textColor = [UIColor whiteColor];
        _mediaLabel.textAlignment = NSTextAlignmentCenter;
        _mediaLabel.font = [UIFont systemFontOfSize:11.0f];
        _mediaLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    }
    return _mediaLabel;
}

@end
