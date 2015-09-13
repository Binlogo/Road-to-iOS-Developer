//
//  BYQuartzFunView.h
//  QuartzFun
//
//  Created by brother on 15/8/27.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYConstants.h"

@interface BYQuartzFunView : UIView

@property (assign, nonatomic) CGPoint firstTouchLocation;
@property (assign, nonatomic) CGPoint lastTouchLocation;
@property (assign, nonatomic) ShapeType shapeType;
@property (assign, nonatomic) BOOL useRandomColor;
@property (strong, nonatomic) UIColor *currentColor;
@property (strong, nonatomic) UIImage *drawImage;
@property (readonly, nonatomic) CGRect currentRect;
@property (assign, nonatomic) CGRect redrawRect;

@end
