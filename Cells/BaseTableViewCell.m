//
//  BaseTableViewCell.m
//  XinhuaNews
//
//  Created by suning on 2018/10/12.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface BaseTableViewCell ()

@property (nonatomic, strong) CALayer *line;
@end

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView.layer addSublayer:self.line];
    return self;
}

- (void)bindWithModel:(id)model {
    _model = model;
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

- (CALayer *)line {
    if (_line == nil) {
        _line = [[CALayer alloc] init];
        _line.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
    return _line;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_isShowLine) {
        _line.frame = CGRectMake(10, self.frame.size.height - 0.5, self.frame.size.width - 20, 0.5);
    }
    self.line.hidden = !_isShowLine;
}

@end
