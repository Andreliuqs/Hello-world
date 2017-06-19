//
//  AnimationController.m
//  SmapleUI
//
//  Created by wulianMac on 2017/6/2.
//  Copyright © 2017年 wulianMac. All rights reserved.
//

#import "AnimationController.h"
#import "ReferenceController.h"

@interface AnimationController () {
    BOOL flag;
    CALayer *layer;
    NSArray *images;
}

@end

@implementation AnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightTextColor];
    
    [self setBackItem];
    [self setTitleText:@"动画"];
    
    UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    navBtn.frame = CGRectMake(0, 0, 60, 44);
    navBtn.backgroundColor = [UIColor clearColor];
    [navBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [navBtn setTitle:@"参考" forState:UIControlStateNormal];
    [navBtn addTarget:self action:@selector(referenceAction) forControlEvents:UIControlEventTouchUpInside];
    navBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    UIBarButtonItem *navBarBtn = [[UIBarButtonItem alloc] initWithCustomView:navBtn];
    
    UIButton *navBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    navBtn1.titleLabel.font = [UIFont systemFontOfSize:16.0];
    navBtn1.frame = CGRectMake(0, 0, 60, 44);
    navBtn1.backgroundColor = [UIColor clearColor];
    [navBtn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [navBtn1 setTitle:@"开始" forState:UIControlStateNormal];
    [navBtn1 addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
    navBtn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    UIBarButtonItem *navBarBtn1 = [[UIBarButtonItem alloc] initWithCustomView:navBtn1];
    self.tqNavBar.topItem.rightBarButtonItems = [NSArray arrayWithObjects:navBarBtn1, navBarBtn, nil];

    
    
    layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(self.view.width/2-50/2, 160, 50, 50);
    layer.cornerRadius = 8;
    [self.view.layer addSublayer:layer];
    
    NSMutableArray *list = [NSMutableArray array];
    if (_aniType == 4) {
        CGFloat w = 20;
        CGFloat h = 20;
        CGFloat sX = self.view.width/2- (w*6+5*5)/2;
        for (int i =0; i<6; i++) {
            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(sX+i*25, 260, w, h)];
            imageview.image = [UIImage imageNamed:@"cicle_num_1"];
            imageview.tag = i+100;
            [self.view addSubview:imageview];
            [list addObject:imageview];
        }
        images = [NSArray arrayWithArray:list];
    }
    // Do any additional setup after loading the view.
}

- (void)referenceAction {
    ReferenceController *vc = [[ReferenceController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)startAction {
    [self startAnimationWithType:1];
    [self startAnimationWithType:_aniType];
}



/**
 1.removedOnCompletion设置为true时fillMode不会起作用，默认设置是true
 2.layer的position的x，y和frame的x,y不是一样的,动画不会改变layer.position
 3.autoreverses设置可以用来做一些往复的动画
 */

- (void)startAnimationWithType:(NSInteger)type {
    switch (type) {
        case 0:
        {
            NSLog(@"移动");
            NSLog(@"layer.position.x%f,layer.position.y%f",layer.position.x,layer.position.y);
            //剧本
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
            animation.fromValue = [NSValue valueWithCGPoint:layer.position];
            if (flag) {
                animation.toValue = [NSValue valueWithCGPoint:CGPointMake(160, layer.position.y+300)];
            } else {
                animation.toValue = [NSValue valueWithCGPoint:CGPointMake(160, layer.position.y-300)];
            }
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            animation.repeatCount = 1;
            animation.duration = 2;
            
//            animation.removedOnCompletion = flag;
            
            animation.removedOnCompletion = NO;

            flag = !flag;
            animation.fillMode = kCAFillModeForwards;
            [layer addAnimation:animation forKey:@"position"];
        }
            
            break;
        case 1:
        {
            //剧本
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];

            animation.fromValue = @1.0;
            animation.toValue = @3;
            animation.autoreverses = YES;    //设置为yes,代表每次重复执行的效果和上次相反
            
            animation.removedOnCompletion = flag;
            flag = !flag;
            animation.fillMode = kCAFillModeForwards;
            animation.repeatCount = MAXFLOAT;//;
            animation.duration = 0.5;
            [layer addAnimation:animation forKey:@"transform.scale"];
        }
            break;
        case 2:
        {
            //剧本
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
            
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 0)];
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1)];
//            animation.autoreverses = YES;    //设置为yes,代表每次重复执行的效果和上次相反
            animation.fromValue = [NSNumber numberWithFloat:0];
            animation.toValue = [NSNumber numberWithFloat:M_PI /2];
            
//            animation.removedOnCompletion = flag;
//            flag = !flag;
            animation.fillMode = kCAFillModeForwards;
            animation.repeatCount = MAXFLOAT;//;
            animation.duration = 0.5;
            [layer addAnimation:animation forKey:@"transform.rotation"];
        }
            break;
        case 3:
        {
            CABasicAnimation *rotationAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            rotationAni.toValue = [NSNumber numberWithFloat:M_PI*2];
            rotationAni.duration = 1.0;
            rotationAni.repeatCount = MAXFLOAT;
            [layer addAnimation:rotationAni forKey:@"rotationAnimation1"];
        }
            break;
            
        case 4:
        {
            
            for (UIImageView *view in images) {
                //剧本
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
                animation.fromValue = [NSValue valueWithCGPoint:view.layer.position];
                animation.toValue = [NSValue valueWithCGPoint:CGPointMake(view.layer.position.x+5, view.layer.position.y)];
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                animation.repeatCount = MAXFLOAT;
                animation.duration = 0.02;
                animation.autoreverses = YES;    //设置为yes,代表每次重复执行的效果和上次相反
                animation.removedOnCompletion = NO;
                animation.fillMode = kCAFillModeForwards;
                [view.layer addAnimation:animation forKey:@"position"];
            }
        }
            break;
        default:
            break;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
