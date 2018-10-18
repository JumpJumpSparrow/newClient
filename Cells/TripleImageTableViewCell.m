//
//  TripleImageTableViewCell.m
//  XinhuaNews
//
//  Created by suning on 2018/10/17.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "TripleImageTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "BaseNewsModel.h"

@interface TripleImageTableViewCell()
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *timesLabel;
@property (nonatomic, strong) NSArray *imageViews;
@end

@implementation TripleImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    UIImageView *i1 = [[UIImageView alloc] init];
    UIImageView *i2 = [[UIImageView alloc] init];
    UIImageView *i3 = [[UIImageView alloc] init];
    i1.contentMode = UIViewContentModeScaleAspectFill;
    i2.contentMode = UIViewContentModeScaleAspectFill;
    i3.contentMode = UIViewContentModeScaleAspectFill;

    i1.clipsToBounds = YES;
    i2.clipsToBounds = YES;
    i3.clipsToBounds = YES;

    [self.contentView addSubview:i1];
    [self.contentView addSubview:i2];
    [self.contentView addSubview:i3];
    [self.contentView addSubview:self.timesLabel];
    [self.contentView addSubview:self.timeLabel];
    
    self.imageViews = @[i1, i2, i3];
    self.isShowLine = YES;
    self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    self.textLabel.numberOfLines = 0;
    return self;
}

- (void)bindWithModel:(id)model {
    if (model == self.model) {
        return;
    }
    [super bindWithModel:model];
    BaseNewsModel *news = (BaseNewsModel *)model;
    NSInteger count = news.images.count;
    count = count > 3 ? 3 : news.images.count;
    for (int i = 0; i < count; i++) {
        
        NSString *url = [news.images objectAtIndex:i];
        UIImageView *view = [self.imageViews objectAtIndex:i];
        [view sd_setImageWithURL:[NSURL URLWithString:url]
                placeholderImage:[UIImage imageNamed:@"placeholder"]];
    }
    self.timeLabel.text = news.releaseime;
    self.timesLabel.text = [NSString stringWithFormat:@"%ld阅", news.readCount];
    self.textLabel.text = news.title;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = [self.textLabel sizeThatFits:CGSizeMake(self.contentView.width - 20, 60)];
    self.textLabel.frame = CGRectMake(10, 10, size.width, size.height);
    
    CGFloat margin = 10.0f;
    CGFloat width = (self.contentView.width - margin * 4)/3;
    UIImageView *view = nil;
    for (int i = 0; i < 3; i++) {
        view = [self.imageViews objectAtIndex:i];
        view.frame = CGRectMake(margin + i * (width + margin) , self.textLabel.bottom + 5, width, width*3/4 - 5);
    }
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
