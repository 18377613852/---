//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "IndexCell.h"
#import "IndexViewModel.h"
#import "UINavigationBar+Awesome.h"
#import "iCarousel.h"
#import "WebViewController.h"
#define NAVBAR_CHANGE_POINT 50
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)IndexViewModel *indexVM;
@end

@implementation ViewController
{//添加成员变量，因为不需要懒加载，所有不需要是属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
- (IndexViewModel *)indexVM{
    if (!_indexVM) {
        _indexVM = [IndexViewModel new];
    }
    return _indexVM;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 44.0f;
        [_tableView registerClass:[IndexCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(-128);
            make.left.right.bottom.mas_equalTo(0);
        }];
    }
    return _tableView;
}

+(UINavigationController *)standardNavi{
    static UINavigationController *Navc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ViewController *vc = [ViewController new];
        Navc = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return Navc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor clearColor];
    self.title = @"今日热文";
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
    [Factory addMenuItemToVC:self];
    [self showProgress];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       
        [self.indexVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self hideProgress];
            self.tableView.tableHeaderView = [self topView];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.indexVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self topView];
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
}
-(UIView *)topView{
    [_timer invalidate];
    UIView *topView = [UIView new];
    topView.backgroundColor = [UIColor lightGrayColor];
    topView.frame = CGRectMake(0, 0, 0, kWindowW*0.68);

//    添加滚动栏
    _ic = [iCarousel new];
    [topView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
 
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:5 block:^(NSTimer *timer) {
        [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.indexVM.indexPicNumber;
    [topView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(5);
    }];
    _titleLb = [UILabel new];
    _titleLb.font = [UIFont boldSystemFontOfSize:19];
    _titleLb.textColor = [UIColor whiteColor];
    _titleLb.numberOfLines = 0;
    [topView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_pageControl.mas_top).mas_equalTo(-5);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-25);
    }];
    _titleLb.text = [self.indexVM topTitleForRow:0];
    _pageControl.userInteractionEnabled = NO;
    return topView;
}
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.indexVM.indexPicNumber;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW*0.68)];
        view = [[UIView alloc]init];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
    }
    UIImageView *imageView = (UIImageView  *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.indexVM topIconForRow:index] placeholderImage:nil];
//    [imageView setImage:[UIImage imageNamed:@"Account_Avatar"]];
    return view;
}
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
/** 监控当前滚到到第几个 */
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    //NSLog(@"%ld", carousel.currentItemIndex);
    _titleLb.text = [self.indexVM topTitleForRow:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.indexVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IndexCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.imageIV.imageView setImageWithURL:[self.indexVM iconForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"Share_YoudaoNote"]];
    cell.titleLb.text = [self.indexVM titleForRow:indexPath.row];
    
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 100;
//}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WebViewController *vc = [[WebViewController alloc]initWithURL:[self.indexVM IDForRow:indexPath.row]];
//    vc.url = ;
    NSLog(@"%@",vc.url);
    NSLog(@"%@",self.navigationController);


    [self.navigationController pushViewController:vc animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
}
@end
