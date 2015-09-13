//
//  ViewController.m
//  Button Fun
//
//  Created by brother on 15/8/3.
//  Copyright (c) 2015年 brother. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed.",title];
//    self.statusLabel.text = plainText;
    NSMutableAttributedString *styledText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:_statusLabel.font.pointSize]};
    NSRange nameRange = [plainText rangeOfString:title];
    [styledText setAttributes:attributes range:nameRange];
    _statusLabel.attributedText = styledText;
}

@end
