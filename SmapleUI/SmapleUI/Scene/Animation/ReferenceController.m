//
//  ReferenceController.m
//  SmapleUI
//
//  Created by wulianMac on 2017/6/2.
//  Copyright © 2017年 wulianMac. All rights reserved.
//

//http://blog.csdn.net/whjay520/article/details/53538266

#import "ReferenceController.h"

@interface ReferenceController ()

@property (strong , nonatomic) UIWebView *webView;

@end

@implementation ReferenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBackItem];
    [self setTitleText:@"参考网页"];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64.0, self.view.width, self.view.height-64.0)];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"animation" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    [_webView sizeToFit];
    _webView.scalesPageToFit = YES;
    _webView.opaque = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];
    // Do any additional setup after loading the view.
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
