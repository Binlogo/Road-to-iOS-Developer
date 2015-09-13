//
//  BlueViewController.m
//  View Switcher
//
//  Created by brother on 15/8/4.
//  Copyright (c) 2015年 brother. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

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

- (IBAction)blueButtonPressed {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Blue!" message:@"Blue button on the blue view" delegate:nil cancelButtonTitle:@"Yep!" otherButtonTitles: nil];
    
    [alert show];
}

@end
