//
//  ViewController.m
//  QuartzFun
//
//  Created by brother on 15/8/27.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "ViewController.h"
#import "BYConstants.h"
#import "BYQuartzFunView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *colorControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor:(UISegmentedControl *)sender {
    ColorTabIndex index = [sender selectedSegmentIndex];
    BYQuartzFunView *funView = (BYQuartzFunView *)self.view;
    
    switch (index) {
        case kRedColorTab:
            funView.currentColor = [UIColor redColor];
            funView.useRandomColor = NO;
            break;
        case kBlueColorTab:
            funView.currentColor = [UIColor blueColor];
            funView.useRandomColor = NO;
            break;
        case kYellowColorTab:
            funView.currentColor = [UIColor yellowColor];
            funView.useRandomColor = NO;
            break;
        case kGreenColorTab:
            funView.currentColor = [UIColor greenColor];
            funView.useRandomColor = NO;
            break;
        case kRandomColorTab:
            funView.useRandomColor = YES;
            break;
        default:
            break;
    }
}

- (IBAction)changeShape:(UISegmentedControl *)sender {
    [(BYQuartzFunView *)self.view setShapeType:[sender selectedSegmentIndex]];
    if ([sender selectedSegmentIndex] == kImageShape) {
        self.colorControl.enabled = NO;
    } else {
        self.colorControl.enabled = YES;
    }
}

@end
