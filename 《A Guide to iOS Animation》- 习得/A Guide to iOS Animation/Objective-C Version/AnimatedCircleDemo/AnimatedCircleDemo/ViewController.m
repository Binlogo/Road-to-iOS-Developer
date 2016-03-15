//
//  ViewController.m
//  AnimatedCircleDemo
//
//  Created by Binboy on 3/15/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) CircleView *circleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.circleView = [[CircleView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.5 - 320 * 0.5, self.view.frame.size.height * 0.5 - 320 * 0.5, 320, 320)];
    [self.view addSubview:self.circleView];
    
    self.circleView.circleLayer.progress = self.slider.value;
}

- (IBAction)valueChanged:(id)sender {
    UISlider *slider = sender;
    self.circleView.circleLayer.progress = slider.value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
