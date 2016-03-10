//
//  ViewController.m
//  Category
//
//  Created by FellowPlus-Binboy on 1/14/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 使用Category的情况
    //  1.Foundation类扩展
    //  2.应用了Factory Method Pattern对象的拓展
    //  3.单例Singleton对象的扩展
    //  4.在项目中出现次数已经多不胜数的对象
    
    // 1.Foundation类扩展
#define CLS(x) NSStringFromClass([x class])
    
    NSLog(@"NSString:%@", CLS([NSString string]));
    NSLog(@"NSMutableString:%@", CLS([NSMutableString string]));
    
    // 2.应用了Factory Method Pattern对象的拓展
    NSLog(@"UIButtonTypeCustom %@",
           CLS([UIButton buttonWithType:UIButtonTypeCustom]));
    NSLog(@"UIButtonTypeRoundedRect %@",
          CLS([UIButton buttonWithType:UIButtonTypeRoundedRect])); // Deprecated
    
    // Category增加新的成员变量或属性
    
    // “對 NSURLSessionTask 撰寫 Category” —— 地雷~！！
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
