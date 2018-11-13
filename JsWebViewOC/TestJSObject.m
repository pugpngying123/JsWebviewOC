//
//  TestJSObject.m
//  JsWebViewOC
//
//  Created by wochu on 2018/10/25.
//  Copyright © 2018年 wochu. All rights reserved.
//

#import "TestJSObject.h"


@implementation TestJSObject
- (void)goBack{
    NSLog(@"goBack");
}

- (void)goHomeWithInfo{
    NSArray *info = [JSContext currentArguments];//任意个参数都可以获取
    self.showWithinfo([info objectAtIndex:0], [info objectAtIndex:1], [info objectAtIndex:2]);
}
@end



