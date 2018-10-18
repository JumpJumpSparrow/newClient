//
//  BaseViewController.m
//  XinhuaNews
//
//  Created by suning on 2018/10/17.
//  Copyright © 2018年 suning. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UILabel *desLabel;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.desLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    self.desLabel.backgroundColor = [UIColor greenColor];
    self.desLabel.font = [UIFont systemFontOfSize:20];
    self.desLabel.center = self.view.center;
    self.desLabel.text = self.desString;
    [self.view addSubview:self.desLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
