//
//  OptionsTableViewCell.m
//  XinhuaNews
//
//  Created by suning on 2018/10/12.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "OptionsTableViewCell.h"
#import <SDWebImage/UIButton+WebCache.h>

@interface OptionsTableViewCell()

@end

@implementation OptionsTableViewCell


- (void)bindWithModel:(id)model {
    
    if (model == self.model) {
        return;
    }
    
    [super bindWithModel:model];
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat margin = 20.0f;
    CGFloat gap = 5.f;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - margin * 2) / 4.0f;
    CGFloat height =  44.0f;
    
    for (int i = 0; i < 8; i++) {
        
        int row = i / 4;
        int col = i % 4;
        
        CGPoint center = CGPointMake(margin + col * width + width/2, gap + height/2 + row * (height + gap));
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44.0f, 44.0f)];
        btn.center = center;
        btn.tag = i;
        [btn setTitle:@"title" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        NSString *url = @"https://tvax4.sina";
        [btn sd_setImageWithURL:[NSURL URLWithString:url]
                       forState:UIControlStateNormal
               placeholderImage:[UIImage imageNamed:@"Image"]];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        
        //相对于原位置 的位移量
        btn.imageEdgeInsets = UIEdgeInsetsMake(- (btn.frame.size.height - btn.titleLabel.frame.size.height - btn.titleLabel.frame.origin.y),(btn.frame.size.width - btn.titleLabel.frame.size.width)/2.0f -btn.imageView.frame.size.width/2, 0, 0);
        btn.titleEdgeInsets = UIEdgeInsetsMake(btn.frame.size.height - btn.imageView.frame.size.height - btn.imageView.frame.origin.y, -btn.imageView.frame.size.width, 0, 0);
        
        [btn addTarget:self action:@selector(didSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:btn];
    }
}

- (void)didSelectBtn:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(optionsTableViewCell:didSelectOption:)]) {
        [self.delegate optionsTableViewCell:self didSelectOption:sender];
    }
}


@end
