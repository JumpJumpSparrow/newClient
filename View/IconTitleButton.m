//
//  IconTitleButton.m
//  XinhuaNews
//
//  Created by suning on 2018/10/12.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "IconTitleButton.h"

@implementation IconTitleButton


- (void)layoutSubviews {
    
    
    [self.imageView sizeToFit];
    [self.titleLabel sizeToFit];

    CGFloat topGap = self.imageView.frame.origin.y;
    CGFloat imageMargin = (self.frame.size.width - self.imageView.frame.size.width) / 2.0f;

    CGFloat bottomeGap = self.frame.size.height - self.titleLabel.frame.size.height - self.titleLabel.frame.origin.y;
    CGFloat titleMargin = (self.frame.size.width - self.titleLabel.frame.size.width) / 2.0f;
    //NSLog(@"=== %@ ==== %@", [NSValue valueWithUIEdgeInsets:self.imageEdgeInsets] ,[NSValue valueWithUIEdgeInsets:self.titleEdgeInsets]);
    //NSLog(@"***%@, ***%@", [NSValue valueWithCGRect:self.imageView.frame], [NSValue valueWithCGRect:self.titleLabel.frame]);
    
    NSLog(@"== %f ==%f  ==%f %f", topGap, imageMargin, bottomeGap, titleMargin);
    
    self.imageEdgeInsets = UIEdgeInsetsMake(-topGap, imageMargin, -topGap, imageMargin);
    
    self.titleEdgeInsets = UIEdgeInsetsMake(-bottomeGap, titleMargin, -bottomeGap, titleMargin);
    //[super layoutSubviews];
}



@end
