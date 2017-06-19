//
//  LeftMenuController.m
//  SmapleUI
//
//  Created by wulianMac on 2017/6/2.
//  Copyright © 2017年 wulianMac. All rights reserved.
//

#import "LeftMenuController.h"

@interface LeftMenuController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation LeftMenuController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 1;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        // slider Height
        return 10;
    } else if (section == 1) {
        return 44;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 50;
    } else if (indexPath.section == 1) {
        return 50;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0)
            cell.textLabel.text = @"动画";//@"意见反馈";
        else if (indexPath.row == 1)
            cell.textLabel.text = @"暂无";//@"关于我们";
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"暂无";//@"注销登录";
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger indx = 0;
    if (indexPath.section == 0) {
        indx = indexPath.row;
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            indx = 5;
        }
    }
    
    if ([self.delegate respondsToSelector:@selector(didSelectWLSliderTableViewCell:)]) {
        [self.delegate didSelectWLSliderTableViewCell:indx];
    }
    
    [tableView reloadData];
}

#pragma mark UI
- (void)loadUI {
    [self setTitleText:@"侧边栏"];
    
    self.tqNavBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width*0.7, self.view.height-70) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        NSLog(@"self.view.width%f",self.view.width);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
