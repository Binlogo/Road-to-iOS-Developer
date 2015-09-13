//
//  ViewController.m
//  Control Fun
//
//  Created by brother on 15/8/3.
//  Copyright (c) 2015年 brother. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sliderLabel.text = @"50";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgrondTap:(id)sender {
    [self.numberField resignFirstResponder];
    [self.nameField resignFirstResponder];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    int progress = lround(sender.value);
    self.sliderLabel.text = [NSString stringWithFormat:@"%d",progress];
}

- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL setting = sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
}

- (IBAction)toggleControls:(UISegmentedControl *)sender {
    // 0 == sitches index
    if (sender.selectedSegmentIndex == 0) {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingButton.hidden = YES;
    }else {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }
}

- (IBAction)buttonPressed:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"你确定？"
                                                             delegate:self
                                                    cancelButtonTitle:@"哦不！"
                                               destructiveButtonTitle:@"必须的"
                                                    otherButtonTitles: nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        NSString *msg = nil;
        if (self.nameField.text.length > 0) {
            msg = [NSString stringWithFormat:@"You Can Breathe Easy，%@，everything went OK.",self.nameField.text];
        }else {
            msg =@"Everything went OK";
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"即将完成"
                                                        message:msg
                                                       delegate:nil
                                              cancelButtonTitle:@"Phew!"
                                              otherButtonTitles: nil];
        [alert show];
    }
}

@end
