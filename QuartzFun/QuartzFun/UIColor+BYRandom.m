//
//  UIColor+BYRandom.m
//  QuartzFun
//
//  Created by brother on 15/8/27.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "UIColor+BYRandom.h"

#define ARC4RANDOM_MAX 0x100000000LL

@implementation UIColor (BYRandom)

+ (UIColor *)randomColor {
    CGFloat red = (CGFloat) arc4random() / (CGFloat) ARC4RANDOM_MAX;
    CGFloat blue = (CGFloat) arc4random() / (CGFloat) ARC4RANDOM_MAX;
    CGFloat green = (CGFloat) arc4random() / (CGFloat) ARC4RANDOM_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
