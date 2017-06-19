//
//  Scene.h
//  tangqu
//
//  Created by AmosCao on 15/7/29.
//  Copyright (c) 2015年 cloudwing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Frame.h"

@interface Scene : UIViewController

@property (nonatomic, strong) UINavigationBar *tqNavBar;

//title
- (void)setTitleText:(NSString *)title;
- (void)setTitleView:(UIView *)titleView;

//bg image
- (void)setNavBarBackgroundColor:(UIColor *)color;
- (void)setNavBackgroundImageName:(NSString *)imageName;

//left
- (void)setBackItem;
- (void)goBack;
- (void)setNavLeftBarWithCustomView:(UIView *)customView;
- (void)setNavLeftBarWithTitle:(NSString *)itemTitle withAction:(SEL)action;
- (void)setNavLeftBarWithImageName:(NSString *)imageName
                       highlighted:(NSString *)highlightedImage
                        withAction:(SEL)action;

//right
- (void)setNavRightBarWithCustomView:(UIView *)customView;
- (void)setNavRightBarWithImageName:(NSString *)imageName
                        highlighted:(NSString *)highlightedImage
                         withAction:(SEL)action;
- (void)setNavRightBarWithTitle:(NSString *)itemTitle withAction:(SEL)action;

@end

