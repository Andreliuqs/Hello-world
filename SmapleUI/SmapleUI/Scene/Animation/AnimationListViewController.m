//
//  AnimationListViewController.m
//  SmapleUI
//
//  Created by wulianMac on 2017/6/2.
//  Copyright © 2017年 wulianMac. All rights reserved.
//

#import "AnimationListViewController.h"
#import "AnimationController.h"

@interface AnimationListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableview;

@property (strong , nonatomic) NSMutableArray *dataSource;

@end

@implementation AnimationListViewController

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellidentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    NSString *str = [_dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AnimationController *Vc = [[AnimationController alloc] init];
    Vc.aniType = indexPath.row;
    [self.navigationController pushViewController:Vc animated:YES];
}


#pragma mark UI
- (void)loadUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self setBackItem];
    [self setTitleText:@"动画列表"];
    
    [self.view addSubview:self.tableview];
    _dataSource = [@[@"移动",@"放缩",@"旋转",@"Z轴旋转",@"震荡"] mutableCopy];
}

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64.0, self.view.width, self.view.height-64.0) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        
    }
    return _tableview;
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
