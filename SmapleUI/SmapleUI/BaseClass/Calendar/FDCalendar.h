//
//  FDCalendar.h
//  FDCalendarDemo
//
//  Created by fergusding on 15/8/20.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FDCalendarSelectDelegate;



@interface FDCalendar : UIView

@property (weak, nonatomic) id<FDCalendarSelectDelegate> delegate;
- (instancetype)initWithCurrentDate:(NSDate *)date;

@end


@protocol FDCalendarSelectDelegate <NSObject>

@optional
- (void)didSelecedCalendarDate:(NSDate *)date;
- (void)didSelecedSearchDate:(NSDate *)date;
@end