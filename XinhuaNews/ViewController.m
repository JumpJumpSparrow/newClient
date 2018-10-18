//
//  ViewController.m
//  XinhuaNews
//
//  Created by suning on 2018/10/10.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "ViewController.h"
#import "BaseNewsModel.h"
#import "LoopCarouselView.h"
#import "OptionsTableViewCell.h"
#import "FullImageTableViewCell.h"
#import "PictureLeftTableViewCell.h"
#import "TripleImageTableViewCell.h"
#import "PlainTextTableViewCell.h"
#import "DoubleImageTableViewCell.h"
#import "BaseViewController.h"

@interface ViewController ()<UITableViewDelegate,
                             UITableViewDataSource,
                             OptionsTableViewCellDelegate,
                             DoubleImageTableViewCellDelegate,
                             LoopCarouselViewDelegate >

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LoopCarouselView *loopView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self randomColor];
    self.dataSource = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i < 100; i ++) {
        BaseNewsModel *news = [[BaseNewsModel alloc] init];
        news.title = @"方法返回一个布尔值，用于检查两个节点是否相等。所谓相等的节点，指的是两个节点的类型相同、属性相同";
        news.releaseime = @"10/15";
        news.duration = @"00:00";
        news.coverImageUrl = @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3817191486,3276892468&fm=27&gp=0.jpg";
        news.images = @[@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=144388917,3393541021&fm=27&gp=0.jpg",
                        @"https://ss0.baidu.com/73x1bjeh1BF3odCf/it/u=987550858,3408515067&fm=85&s=647210C707A3A1414AF8BDAF0300F003",
                        @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1692206798,1566782913&fm=58&bpow=600&bpoh=450"];
        [self.dataSource addObject:news];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[OptionsTableViewCell class] forCellReuseIdentifier:[OptionsTableViewCell cellIdentifier]];
    [self.tableView registerClass:[FullImageTableViewCell class] forCellReuseIdentifier:[FullImageTableViewCell cellIdentifier]];
    [self.tableView registerClass:[PictureLeftTableViewCell class] forCellReuseIdentifier:[PictureLeftTableViewCell cellIdentifier]];
    [self.tableView registerClass:[TripleImageTableViewCell class] forCellReuseIdentifier:[TripleImageTableViewCell cellIdentifier]];
    [self.tableView registerClass:[PlainTextTableViewCell class] forCellReuseIdentifier:[PlainTextTableViewCell cellIdentifier]];
    [self.tableView registerClass:[DoubleImageTableViewCell class] forCellReuseIdentifier:[DoubleImageTableViewCell cellIdentifier]];

    LoopCarouselView *loopView = [[LoopCarouselView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200.0f)];
    loopView.dataList = [self.dataSource subarrayWithRange:NSMakeRange(0, 10)];
    loopView.loopViewDelegate = self;
    [loopView reloadData];
    
    self.tableView.tableHeaderView = loopView;
    [self.view addSubview:self.tableView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    BaseNewsModel *news = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = news.title;
    
    NSInteger index = indexPath.row % 6;
    
    if (index == 0) {
        PlainTextTableViewCell *pcell = [tableView dequeueReusableCellWithIdentifier:[PlainTextTableViewCell cellIdentifier]];
        [pcell bindWithModel:news];
        return pcell;
    } else if (index == 1) {
        OptionsTableViewCell *ocell = [tableView dequeueReusableCellWithIdentifier:[OptionsTableViewCell cellIdentifier]];
        [ocell bindWithModel:@"dd"];
        ocell.delegate = self;
        return ocell;
    } else if (index == 2) {
        
        FullImageTableViewCell *fcell = [tableView dequeueReusableCellWithIdentifier:[FullImageTableViewCell cellIdentifier]];
        NSString *url = @"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1566842483,1420064525&fm=27&gp=0.jpg";
        [fcell bindWithModel:url];
        return fcell;
    } else if (index == 3) {
        PictureLeftTableViewCell *pcell = [tableView dequeueReusableCellWithIdentifier:[PictureLeftTableViewCell cellIdentifier]];
        [pcell bindWithModel:news];
        return pcell;
    } else if (index == 4) {
        TripleImageTableViewCell *tcell = [tableView dequeueReusableCellWithIdentifier:[TripleImageTableViewCell cellIdentifier]];
        [tcell bindWithModel:news];
        return tcell;
    } else if (index == 5) {
        DoubleImageTableViewCell *dcell = [tableView dequeueReusableCellWithIdentifier:[DoubleImageTableViewCell cellIdentifier]];
        [dcell bindWithModel:news];
        dcell.delegate = self;
        return dcell;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row % 6;

    
    if (index == 1|| index == 2|| index == 3) {
        return 100.0f;
    }

    if (index == 4) {
        return 150.0f;
    }
    if (index == 0) {
        return 60.0f;
    }
    if (index == 5) {
        return 150.0f;
    }
    return 44.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseViewController *vc = [[BaseViewController alloc] init];
    vc.desString = [NSString stringWithFormat:@"列表 第 %ld个",indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)doubleImageTableViewCell:(DoubleImageTableViewCell *)cell didSelectButton:(TitleButton *)button {
    
    BaseViewController *vc = [[BaseViewController alloc] init];
    vc.desString = [NSString stringWithFormat:@"双列表 第 %ld个",button.tag];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)optionsTableViewCell:(OptionsTableViewCell *)cell didSelectOption:(UIButton *)option {
    BaseViewController *vc = [[BaseViewController alloc] init];
    vc.desString = [NSString stringWithFormat:@"推荐位 第 %ld个",option.tag];
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"OptionsTableViewCell %ld", option.tag);
}

- (void)loopCarouselView:(LoopCarouselView *)loopView didSelectIndex:(NSInteger)index {
    BaseViewController *vc = [[BaseViewController alloc] init];
    vc.desString = [NSString stringWithFormat:@"轮播位 第 %ld个",index];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
