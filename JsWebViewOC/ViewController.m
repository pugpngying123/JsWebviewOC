//
//  ViewController.m
//  JsWebViewOC
//
//  Created by wochu on 2018/10/24.
//  Copyright © 2018年 wochu. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "TestJSObject.h"
@interface ViewController ()<UIWebViewDelegate>
{
    UIWebView *webview;
    JSContext *contex;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    webview = [[UIWebView alloc]initWithFrame:CGRectMake(100, 100, 320, 500)];
    webview.delegate = self;
    NSString *htmlPath = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"html"];
    NSString *htmlStr = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:htmlStr baseURL:nil];
    [self.view addSubview:webview];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    //首先创建JSContext对象（此处通过当前webView的键获取到jscontext）
    contex=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
   //创建我们新建类的对象，将他赋值给js的对象
    TestJSObject *testJO=[TestJSObject new];
    
    //设置多个回调
    testJO.showWithinfo = ^(NSString *idd, NSString *namee, NSString *sexx) {
        NSLog(@" id = %@", idd);
        NSLog(@" name = %@", namee);
        NSLog(@" sex = %@", sexx);
    };
    //将他赋值给js的对象
    contex[@"listener"]=testJO;
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
