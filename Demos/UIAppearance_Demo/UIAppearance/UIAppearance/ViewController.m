//
//  ViewController.m
//  UIAppearance
//
//  Created by MayerF on 2017/11/24.
//  Copyright © 2017年 MayerF. All rights reserved.
//

#import "ViewController.h"
#import "MYCustomObj.h"
#import "MYContainerView.h"

@interface ViewController ()
@property (nonatomic, strong)UISwitch *pTempSwitch;
@property (nonatomic, strong)MYContainerView *pContainerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MYCustomObj appearance].customFloat = 1000;
    
    MYCustomObj *test1 = [MYCustomObj new];
    MYCustomObj *test2 = [MYCustomObj new];
    
    // 执行外观处理
    //    [[MYCustomObj appearance] applyInvocationTo:test1];// 提示MYCustomObj中没有声明此方法
    id appearance = [MYCustomObj appearance];//利用运行时特性
    [appearance applyInvocationTo: test1];
    [appearance applyInvocationTo: test2];
    
    NSLog(@"test1 is %f\n", test1.customFloat);
    NSLog(@"test2 is %f\n", test2.customFloat);
    
    
    UISwitch * appear = [UISwitch appearance];
    appear.tintColor = [UIColor redColor];
    
    [UISwitch appearanceWhenContainedInInstancesOfClasses:@[[MYContainerView class]]].tintColor = [UIColor blueColor];
    
    // 对象创建默认tintColor为null
    _pTempSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 50, 30)];
    UISwitch *switch2 = [[UISwitch alloc] initWithFrame:CGRectMake(100, 200, 50, 30)];
    
    _pContainerView = [[MYContainerView alloc] initWithFrame:CGRectMake(200, 100, 100, 200)];
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 50, 150, 30);
    btn.backgroundColor = [UIColor purpleColor];
    [btn setTitle:@"更新外观信息" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"switch's 当前 tintColor is %@", _pTempSwitch.tintColor);
    
    
    [self.view addSubview:_pTempSwitch];
    [self.view addSubview:switch2];
//    [self.view addSubview:_pContainerView];
    [self.view addSubview:btn];
    
    NSLog(@"加到视图上之后 tintColor is %@", _pTempSwitch.tintColor);
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"视图将要显示后 tintColor is %@", _pTempSwitch.tintColor);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"视图完全显示后 tintColor is %@", _pTempSwitch.tintColor);
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"视图将要布局 tintColor is %@", _pTempSwitch.tintColor);
}

- (void)btnOnClick
{
    [UISwitch appearance].tintColor = [UIColor blueColor];
    
    UISwitch *switch3 = [[UISwitch alloc] initWithFrame:CGRectMake(100, 300, 50, 30)];
    [self.view addSubview:switch3];
}

/*
    1. MYAppearance中保存着注册类的注册消息(添加到MYAppearance中的消息)
    2. 系统的消息执行方法是在某个行为中执行 ，具体在哪尚不清楚。
 */


@end
