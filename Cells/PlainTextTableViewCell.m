//
//  PlainTextTableViewCell.m
//  XinhuaNews
//
//  Created by suning on 2018/10/17.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "PlainTextTableViewCell.h"
#import "BaseNewsModel.h"

@implementation PlainTextTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self.contentView addSubview:self.timesLabel];
    [self.contentView addSubview:self.timeLabel];
    self.isShowLine = YES;
    self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    self.textLabel.numberOfLines = 2;
    return self;
}

-(void)bindWithModel:(id)model {
    if (model == self.model) {
        return;
    }
    [super bindWithModel:model];
    BaseNewsModel *news = (BaseNewsModel *)model;
    self.timeLabel.text = news.releaseime;
    self.timesLabel.text = [NSString stringWithFormat:@"%ld阅", news.readCount];
    self.textLabel.text = news.title;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = [self.textLabel sizeThatFits:CGSizeMake(self.contentView.width - 20, 60)];
    self.textLabel.frame = CGRectMake(10, 5, size.width, size.height);
    
    size = [self.timeLabel sizeThatFits:CGSizeMake(100, 40)];
    self.timeLabel.frame = CGRectMake(10, self.contentView.height - size.height - 5 ,size.width, size.height);
    
    size = [self.timesLabel sizeThatFits:CGSizeMake(100, 40)];
    self.timesLabel.frame = CGRectMake(self.contentView.width - 10 - size.width, self.contentView.height - size.height - 5, size.width, size.height);
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

@end
