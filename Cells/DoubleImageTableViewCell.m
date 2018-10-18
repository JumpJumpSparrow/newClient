//
//  DoubleImageTableViewCell.m
//  XinhuaNews
//
//  Created by suning on 2018/10/17.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "DoubleImageTableViewCell.h"
#import "BaseNewsModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DoubleImageTableViewCell()

@property (nonatomic, strong) TitleButton *leftButton;
@property (nonatomic, strong) TitleButton *rightButton;
@end


@implementation DoubleImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self.contentView addSubview:self.leftButton];
    [self.contentView addSubview:self.rightButton];
    
    return self;
}

- (void)bindWithModel:(id)model {
    if (model == self.model) {
        return;
    }
    [super bindWithModel:model];
    BaseNewsModel *news = (BaseNewsModel *)model;
    
    [self.leftButton.newsImageView sd_setImageWithURL:[NSURL URLWithString:news.coverImageUrl]
                                     placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [self.rightButton.newsImageView sd_setImageWithURL:[NSURL URLWithString:news.coverImageUrl]
                                      placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.leftButton.newsTitle.text = news.title;
    self.rightButton.newsTitle.text = news.title;
    
    [self setNeedsLayout];
}

- (void)didSelectButton:(TitleButton *)sender {
    if ([self.delegate respondsToSelector:@selector(doubleImageTableViewCell:didSelectButton:)]) {
        [self.delegate doubleImageTableViewCell:self didSelectButton:sender];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = 10.f;
    CGFloat width = (self.width - margin)/2;
    
    self.leftButton.frame = CGRectMake(0, 5, width, self.height);
    self.rightButton.frame = CGRectMake(width + margin, 5, width, self.height);
}

-(TitleButton *)leftButton {
    if (_leftButton == nil) {
        _leftButton = [[TitleButton alloc] init];
        _leftButton.tag = 0;
        [_leftButton addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (TitleButton *)rightButton {
    if (_rightButton == nil) {
        _rightButton = [[TitleButton alloc] init];
        _rightButton.tag  = 1;
        [_rightButton addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

@end

@implementation TitleButton


- (instancetype)init {
    self = [super init];
    [self addSubview:self.newsImageView];
    [self addSubview:self.newsTitle];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.newsImageView.frame = CGRectMake(0, 0, self.width, self.height - 40);
    self.newsTitle.frame = CGRectMake(0, self.height - 40, self.width - 10, 40);
}

- (UIImageView *)newsImageView {
    if (_newsImageView == nil) {
        _newsImageView = [[UIImageView alloc] init];
        _newsImageView.contentMode = UIViewContentModeScaleAspectFill;
        _newsImageView.clipsToBounds = YES;
    }
    return _newsImageView;
}

- (UILabel *)newsTitle {
    if (_newsTitle == nil) {
        _newsTitle = [[UILabel alloc] init];
        _newsTitle.font = [UIFont systemFontOfSize:14.0f];
        _newsTitle.numberOfLines = 2;
    }
    return _newsTitle;
}

@end
