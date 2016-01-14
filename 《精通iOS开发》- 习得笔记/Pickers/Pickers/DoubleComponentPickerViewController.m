//
//  DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by brother on 15/8/4.
//  Copyright (c) 2015年 brother. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"
#define sceanComponent 0
#define seasonComponent 1

@interface DoubleComponentPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong, nonatomic) NSArray *menu1;
@property (strong, nonatomic) NSArray *menu2;

@end

@implementation DoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menu1 = @[@"阳光",@"雨露",@"雾水",@"瀑布",@"彩虹"];
    self.menu2 = @[@"春",@"夏",@"秋",@"冬"];
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
    NSInteger sceanRow = [self.doublePicker selectedRowInComponent:sceanComponent];
    NSInteger seasonRow = [self.doublePicker selectedRowInComponent:seasonComponent];
    
    NSString *scean = self.menu1[sceanRow];
    NSString *season = self.menu2[seasonRow];
    
    NSString *message = [NSString stringWithFormat:@"你的选择是：%@和%@",scean,season];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"去哪儿" message:message delegate:nil cancelButtonTitle:@"嗯呐" otherButtonTitles: nil];
    [alert show];
}

#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == sceanComponent) {
        return [self.menu1 count];
    }else {
        return [self.menu2 count];
    }
}

#pragma mark Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == sceanComponent) {
        return self.menu1[row];
    }else {
        return self.menu2[row];
    }
}

@end
