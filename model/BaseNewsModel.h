//
//  BaseNewsModel.h
//  XinhuaNews
//
//  Created by suning on 2018/10/10.
//  Copyright © 2018年 suning. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NewsType) {
    NewsTypePlainText,
    NewsTypeVideo,
    NewsTypeImage,
};

@interface BaseNewsModel : NSObject
@property (nonatomic, copy) NSString *title; // 新闻标题
@property (nonatomic, copy) NSString *subTitle; //副标题
@property (nonatomic, copy) NSString *coverImageUrl; //新闻封面图片地址
@property (nonatomic, copy) NSString *releaseime; // 新闻发布时间
@property (nonatomic, copy) NSString *duration; // 多媒体内容持续时长
@property (nonatomic, assign) NSInteger readCount;
@property (nonatomic, assign) NewsType *newsType; // 新闻类型
@property (nonatomic, strong) NSArray *images;
@end
