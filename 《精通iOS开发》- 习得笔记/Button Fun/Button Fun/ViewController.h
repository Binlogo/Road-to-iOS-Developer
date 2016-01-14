//
//  ViewController.h
//  Button Fun
//
//  Created by brother on 15/8/3.
//  Copyright (c) 2015年 brother. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)buttonPressed:(UIButton *)sender;

@end

