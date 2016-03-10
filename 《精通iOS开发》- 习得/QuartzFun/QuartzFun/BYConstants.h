//
//  BYConstants.h
//  QuartzFun
//
//  Created by brother on 15/8/27.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#ifndef QuartzFun_BYConstants_h
#define QuartzFun_BYConstants_h

typedef NS_ENUM (NSInteger, ShapeType) {
    kLineShape = 0,
    kRectShape,
    kEllipseShape,
    kImageShape
};

typedef NS_ENUM (NSInteger, ColorTabIndex) {
    kRedColorTab = 0,
    kBlueColorTab,
    kYellowColorTab,
    kGreenColorTab,
    kRandomColorTab
};

#define degreesToRadian(x) (M_PI *(x) / 180)

#endif
