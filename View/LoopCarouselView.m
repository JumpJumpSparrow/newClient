//
//  LoopCarouselView.m
//  XinhuaNews
//
//  Created by suning on 2018/10/10.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "LoopCarouselView.h"

@interface LoopCarouselItem :UIImageView

@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation LoopCarouselItem

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];

    CGFloat height = 30.0f;
    CGFloat width = frame.size.width - 20.0f;
    CGRect rect = CGRectMake(10.0f, frame.size.height - height, width, height);
    //标题
    self.titleLabel = [[UILabel alloc] initWithFrame:rect];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    //添加渐变层
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    rect.size.width = frame.size.width;
    rect.origin.x = 0.0f;
    layer.frame = rect;
    
    layer.colors = @[(__bridge id)[[UIColor blackColor] colorWithAlphaComponent:0.0] .CGColor, (__bridge id)[[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor];
    layer.startPoint = CGPointMake(0.0f, 0.0f);
    layer.endPoint = CGPointMake(0.0f, 1.0f);
    layer.locations = @[[NSNumber numberWithFloat:0.2]];
    
    [self.layer addSublayer:layer];
    [self addSubview:self.titleLabel];
    self.backgroundColor = [self randomColor];
    return self;
}
- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}
@end


@interface LoopCarouselView ()<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic, strong) UIPageControl *indicator;
@property (nonatomic, strong) NSTimer *loopTimer;
@end

@implementation LoopCarouselView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.dataSource = self;
    self.delegate = self;
    self.type = iCarouselTypeLinear;
    self.pagingEnabled = YES;
    
    [self addSubview:self.indicator];
    
    return self;
}
- (void)reloadData {
    [super reloadData];
    [self startLoop];
    self.indicator.currentPage = 0;
}

- (void)setDataList:(NSArray<BaseNewsModel *> *)dataList {
    _dataList = dataList;
    self.indicator.numberOfPages = dataList.count;
    CGSize size = [self.indicator sizeForNumberOfPages:dataList.count];
    self.indicator.frame = CGRectMake(10.0f, self.frame.size.height - 60.0f, size.width, size.height);
}

- (void)startLoop {
    
    if (_loopTimer == nil) {
        _loopTimer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(oneStep) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_loopTimer forMode:NSDefaultRunLoopMode];
    }
}

- (void)oneStep {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self scrollByNumberOfItems:1 duration:0.5];
    });
}

- (void)stopLoop {
    [_loopTimer invalidate];
    _loopTimer = nil;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.dataList.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    LoopCarouselItem *item = nil;
    if (view == nil) {
        view = [[LoopCarouselItem alloc] initWithFrame:self.frame];
    }
    BaseNewsModel *news = [self.dataList objectAtIndex:index];
    item = (LoopCarouselItem *)view;
    item.titleLabel.text = news.title;
    return item;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    if ([self.loopViewDelegate respondsToSelector:@selector(loopCarouselView:didSelectIndex:)]) {
        [self.loopViewDelegate loopCarouselView:self didSelectIndex:index];
    }
}

- (void)carouselWillBeginDragging:(iCarousel *)carousel {
    [self stopLoop];
}

- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate {
    [self startLoop];
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    self.indicator.currentPage = carousel.currentItemIndex;
}

- (UIPageControl *)indicator {
    if (_indicator == nil) {
        _indicator = [[UIPageControl alloc] init];
        _indicator.enabled = NO;
        _indicator.pageIndicatorTintColor = [UIColor whiteColor];
        _indicator.currentPageIndicatorTintColor = [UIColor blueColor];
    }
    return _indicator;
}

@end
