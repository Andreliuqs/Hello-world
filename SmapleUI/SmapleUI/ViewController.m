//
//  ViewController.m
//  SmapleUI
//
//  Created by wulianMac on 2017/6/1.
//  Copyright © 2017年 wulianMac. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"
#import "HomeViewController.h"

@interface ViewController ()

@property (strong , nonatomic) UIScrollView *myscrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view addSubview:self.myscrollView];
    
    [self performSelector:@selector(pushToHome) withObject:nil afterDelay:2.0];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)pushToHome {
    HomeViewController *vc = [[HomeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIScrollView *)myscrollView {
    if (_myscrollView == nil) {
        _myscrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _myscrollView.pagingEnabled = YES;
        _myscrollView.showsHorizontalScrollIndicator = NO;
        _myscrollView.backgroundColor = [UIColor whiteColor];
        
        NSArray *imglist = @[@"bg_guide_1", @"bg_guide_2", @"bg_guide_3"];
        for (NSInteger i = 0; i < 3; ++i) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*_myscrollView.width, 0, _myscrollView.width, _myscrollView.height)];
            imageView.image = [UIImage imageNamed:imglist[i]];
            [_myscrollView addSubview:imageView];
        }
        _myscrollView.contentSize = CGSizeMake(_myscrollView.width * imglist.count, _myscrollView.height);
    }
    
    return _myscrollView;
}

@end
