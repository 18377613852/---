//
//  NextViewController.m
//  BaseProject
//
//  Created by apple-jd09 on 15/11/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NextViewController.h"
#import "NextViewModel.h"
@interface NextViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NextViewModel *nextVM;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation NextViewController
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NextViewModel *)nextVM{
    if (!_nextVM) {
        _nextVM = [[NextViewModel alloc]initWithID:_ID];
    }
    return _nextVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
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
