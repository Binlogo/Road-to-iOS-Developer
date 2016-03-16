//
//  ViewController.m
//  GooeySlideMenuDemo
//
//  Created by Binboy on 3/15/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import "ViewController.h"
#import "GooeySlideMenu.h"

@interface ViewController ()

@property (strong, nonatomic) GooeySlideMenu *menu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menu = [[GooeySlideMenu alloc] initWithTitles:@[@"首页",@"消息"]];
    
    [self.menu triggerGooeyAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
