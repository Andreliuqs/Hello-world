//
//  Scene.m
//  tangqu
//
//  Created by AmosCao on 15/7/29.
//  Copyright (c) 2015年 cloudwing. All rights reserved.
//

#import "Scene.h"

@implementation Scene

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        [[UIDevice currentDevice] performSelector:@selector(setOrientation:)
                                       withObject:nil];
    }
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.tqNavBar];
    self.tqNavBar.translucent = true;
    
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:244/255.0 blue:242/255.0 alpha:1.0];
    
//    [self setNavBarBackgroundColor:RL_MAIN_COLOR];
    [self.tqNavBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:                                                                     [UIColor blackColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:17.0],NSFontAttributeName,
        nil]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark getter
- (UINavigationBar *)tqNavBar {
    if (_tqNavBar == nil) {
        _tqNavBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 64.0)];
        [_tqNavBar pushNavigationItem:[UINavigationItem new] animated:NO];
    }
    return _tqNavBar;
}

#pragma mark - methods
- (void)setTitleText:(NSString *)title {
    self.tqNavBar.topItem.title = title;
}

- (void)setTitleView:(UIView *)titleView {
    self.tqNavBar.topItem.titleView = titleView;
}

- (void)setNavBackgroundImageName:(NSString *)imageName {
    [self.tqNavBar setBackgroundImage:[UIImage imageNamed:imageName] forBarMetrics:UIBarMetricsDefault];
}

- (void)setNavBarBackgroundColor:(UIColor *)color {
    self.tqNavBar.backgroundColor = color;
}

- (void)setBackItem {
    [self setNavLeftBarWithImageName:@"fanhui"  highlighted:@"fanhui" withAction:@selector(goBack)];
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)setNavLeftBarWithCustomView:(UIView *)customView {
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:customView];
    self.tqNavBar.topItem.leftBarButtonItem = item;
}

- (void)setNavLeftBarWithImageName:(NSString *)imageName highlighted:(NSString *)highlightedImage withAction:(SEL)action {
    UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navBtn.frame = CGRectMake(0, 0, 44, 44);
    navBtn.backgroundColor = [UIColor clearColor];
    [navBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (highlightedImage) {
        [navBtn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    }
    [navBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *navBarBtn = [[UIBarButtonItem alloc] initWithCustomView:navBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = -10;
    self.tqNavBar.topItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, navBarBtn, nil];
}

- (void)setNavLeftBarWithTitle:(NSString *)itemTitle withAction:(SEL)action {
    UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    navBtn.frame = CGRectMake(0, 0, 60, 44);
    navBtn.backgroundColor = [UIColor clearColor];
    [navBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [navBtn setTitle:itemTitle forState:UIControlStateNormal];
    [navBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    navBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    UIBarButtonItem *navBarBtn = [[UIBarButtonItem alloc] initWithCustomView:navBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = -16;
    
    self.tqNavBar.topItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, navBarBtn, nil];
}


// 设置导航栏右边Item
- (void)setNavRightBarWithCustomView:(UIView *)customView {
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:customView];
    self.tqNavBar.topItem.rightBarButtonItem = item;
}

- (void)setNavRightBarWithTitle:(NSString *)itemTitle withAction:(SEL)action {
    UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    navBtn.frame = CGRectMake(0, 0, 60, 44);
    navBtn.backgroundColor = [UIColor clearColor];
    [navBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [navBtn setTitle:itemTitle forState:UIControlStateNormal];
    [navBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    navBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    UIBarButtonItem *navBarBtn = [[UIBarButtonItem alloc] initWithCustomView:navBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = -16;
    self.tqNavBar.topItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, navBarBtn, nil];
}

- (void)setNavRightBarWithImageName:(NSString *)imageName highlighted:(NSString *)highlightedImage withAction:(SEL)action {
    UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [navBtn setFrame:CGRectMake(0, 0, 44, 44)];
    [navBtn setBackgroundColor:[UIColor clearColor]];
    [navBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (highlightedImage) {
        [navBtn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    }
    [navBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *navBarBtn = [[UIBarButtonItem alloc] initWithCustomView:navBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    self.tqNavBar.topItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, navBarBtn, nil];
}


@end
