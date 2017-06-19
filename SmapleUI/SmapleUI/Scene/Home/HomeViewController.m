//
//  HomeViewController.m
//  SmapleUI
//
//  Created by wulianMac on 2017/6/1.
//  Copyright © 2017年 wulianMac. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+Frame.h"
#import "AnimationListViewController.h"
#import "LeftMenuController.h"

@interface HomeViewController ()<LeftMenuControllerDelegate>


@property (strong , nonatomic) LeftMenuController *ctrol;

@end

@implementation HomeViewController


#pragma mark lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(_ctrol.view.x >=0) {
        [self leftMenuShow];
    }
}

#pragma mark method
- (void)leftMenuShow {
    if (_ctrol.view.x >=0) {
        [UIView animateWithDuration:0.4 animations:^{
            _ctrol.view.x = -self.view.width*0.7;
        }];
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            _ctrol.view.x = 0;
        }];
    }
}

- (void)didSelectWLSliderTableViewCell:(NSUInteger)index {
    if (index == 0) {
        AnimationListViewController *Vc = [[AnimationListViewController alloc] init];
        [self.navigationController pushViewController:Vc animated:YES];
        _ctrol.view.x = -self.view.width*0.7;
    }
}


#pragma mark UI
- (void)loadUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitleText:@"首页"];
    [self setNavLeftBarWithTitle:@"菜单" withAction:@selector(leftMenuShow)];    
    _ctrol = [[LeftMenuController alloc] init];
    _ctrol.view.frame = CGRectMake(-self.view.width*0.7, 0, self.view.width*0.7, self.view.height);
    _ctrol.delegate = self;
    [self.view addSubview:_ctrol.view];
}

- (void)animationAction {
    AnimationListViewController *vc = [[AnimationListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
    

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
