//
//  WebViewController.m
//  BaseProject
//
//  Created by apple-jd09 on 15/11/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation WebViewController
-(instancetype)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        _webView.delegate =self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSString *path = [NSString stringWithFormat:@"http://daily.zhihu.com/story/%ld",self.ID];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    [Factory addBackItemToVC:self];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
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
