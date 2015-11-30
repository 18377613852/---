//
//  LeftViewController.m
//  BaseProject
//
//  Created by apple-jd09 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)NSArray *dataArr;
@end

@implementation LeftViewController
- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSArray new];
        _dataArr = @[@"首页",@"日常心里",@"用户推荐日报",@"电影日报",@"不许无聊",@"设计日报",@"大公司日报",@"财经日报",@"互联网安全",@"开始游戏",@"音乐日报",@"动漫日报",@"体育日报"];
    }
    return _dataArr;
}
+(UITabBarController *)sharedTabBar{
    static UITabBarController *TabBar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        LeftViewController *vc = [LeftViewController new];
        TabBar = [UITabBarController new];
        
    });
    return TabBar;
}
- (UIView *)backView{
    if (!_backView) {
        _backView = [UIView new];
        //450.250   275.375
        //        _topView.frame = CGRectMake(0, 0, kWindowW, kWindowW*0.73);
        _backView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_backView];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW*0.73, kWindowH*0.15));
        }];
    }
    return _backView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topView.mas_bottom);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(self.backView.mas_top);
            make.width.mas_equalTo(kWindowW*0.73);
//            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}
- (UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
        //450.250   275.375
//        _topView.frame = CGRectMake(0, 0, kWindowW, kWindowW*0.73);
        _topView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW*0.73, kWindowH*0.26));
        }];
    }
    return _topView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self topView];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor greenSeaColor];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 13;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"Back"] forState:UIControlStateNormal];
    [cell.contentView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
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
