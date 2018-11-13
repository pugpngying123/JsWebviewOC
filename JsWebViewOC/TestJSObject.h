//
//  TestJSObject.h
//  JsWebViewOC
//
//  Created by wochu on 2018/10/25.
//  Copyright © 2018年 wochu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <JavaScriptCore/JavaScriptCore.h>

@protocol TestJSObjectProtocol <JSExport>
- (void)goBack;
- (void)goHomeWithInfo;
@end

@interface TestJSObject : NSObject<TestJSObjectProtocol>

///定义三种block，回调到控制器中；
@property (nonatomic,copy)void(^showWithinfo)(NSString *idd,NSString *namee,NSString *sexx);


@end


