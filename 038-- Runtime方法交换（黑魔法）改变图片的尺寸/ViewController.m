//
//  ViewController.m
//  038-- Runtime方法交换（黑魔法）改变图片的尺寸
//
//  Created by 顾雪飞 on 16/12/22.
//  Copyright © 2016年 顾雪飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 在模拟器Debug中查看是否拉伸了图片
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
    imageView.image = [UIImage imageNamed:@"meinv"];
    
}


@end
