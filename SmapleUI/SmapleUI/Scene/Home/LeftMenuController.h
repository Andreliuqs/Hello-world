//
//  LeftMenuController.h
//  SmapleUI
//
//  Created by wulianMac on 2017/6/2.
//  Copyright © 2017年 wulianMac. All rights reserved.
//

#import "Scene.h"

@protocol LeftMenuControllerDelegate <NSObject>
@optional
- (void)didSelectWLSliderTableViewCell:(NSUInteger)index;
@end


@interface LeftMenuController : Scene

@property (weak , nonatomic) id<LeftMenuControllerDelegate>delegate;

@end
