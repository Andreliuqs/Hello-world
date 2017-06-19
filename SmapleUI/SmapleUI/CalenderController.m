//
//  CalenderController.m
//  SmapleUI
//
//  Created by wulianMac on 2017/6/2.
//  Copyright © 2017年 wulianMac. All rights reserved.
//

#import "CalenderController.h"
#import "FDCalendar.h"
#import "UIView+Frame.h"

@interface CalenderController ()<FDCalendarSelectDelegate> {
    FDCalendar *calender;
}

@end

@implementation CalenderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    calender = [[FDCalendar alloc] initWithCurrentDate:[NSDate date]];
    CGRect frame = calender.frame;
    frame.origin.y = (self.view.height-  frame.size.height)/2;
    frame.origin.x = (self.view.width - frame.size.width)/2;
    calender.center = self.view.center;
    calender.frame = frame;
    calender.delegate = self;
    [self.view addSubview:calender];

    [self setBackItem];
    // Do any additional setup after loading the view.
}

- (void)didSelecedCalendarDate:(NSDate *)date {
    NSLog(@"didSelecedCalendarDate->%@",date);
}

- (void)didSelecedSearchDate:(NSDate *)date {
    NSLog(@"didSelecedSearchDate->%@",date);
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
