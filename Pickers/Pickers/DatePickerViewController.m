//
//  DatePickerViewController.m
//  Pickers
//
//  Created by brother on 15/8/4.
//  Copyright (c) 2015年 brother. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DatePickerViewController

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

- (IBAction)buttonPressed:(id)sender {
    NSDate *selected = [self.datePicker date];
    NSString *message = [NSString stringWithFormat:@"你选择的时间是：%@",selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"时间" message:message delegate:nil cancelButtonTitle:@"That's it!" otherButtonTitles: nil];
    [alert show];
}

@end
