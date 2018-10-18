//
//  LoopCarouselView.h
//  XinhuaNews
//
//  Created by suning on 2018/10/10.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "iCarousel.h"
#import "BaseNewsModel.h"
@class LoopCarouselView;

@protocol LoopCarouselViewDelegate <NSObject>

@optional
- (void)loopCarouselView:(LoopCarouselView *)loopView didSelectIndex:(NSInteger)index;
@end

@interface LoopCarouselView : iCarousel

@property (nonatomic, weak) id <LoopCarouselViewDelegate>loopViewDelegate;
@property (nonatomic, strong) NSArray <BaseNewsModel *>*dataList;
@end
