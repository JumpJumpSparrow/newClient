//
//  BaseTableViewCell.h
//  XinhuaNews
//
//  Created by suning on 2018/10/12.
//  Copyright © 2018年 suning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic, readonly, strong) id model;
@property (nonatomic, assign) BOOL isShowLine;

- (void)bindWithModel:(id)model;
+ (NSString *)cellIdentifier;
@end
