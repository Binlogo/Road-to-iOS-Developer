//
//  GooeySlideMenu.m
//  GooeySlideMenuDemo
//
//  Created by Binboy on 3/15/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import "GooeySlideMenu.h"

#define buttonSpace 30
#define menuBlankWidth 50 // 回弹区域宽度

@interface GooeySlideMenu ()

@property (strong, nonatomic) CADisplayLink *displayLink;
@property (assign, nonatomic) NSInteger animationCount;

@end

@implementation GooeySlideMenu {
    UIVisualEffectView *blurView;
    UIView *helperSideView;
    UIView *helperCenterView;
    UIWindow *keyWindow;
    BOOL triggered;
    CGFloat diff;  //???
    UIColor *menuColor;
    CGFloat menuButtonHeight;
}

- (instancetype)initWithTitles:(NSArray *)titles {
    return [self initWithTitles:titles buttonHeight:40.f menuColor:[UIColor colorWithRed:0 green:0.722 blue:1 alpha:1] backBlurStyle:UIBlurEffectStyleDark];
}

- (instancetype)initWithTitles:(NSArray *)titles buttonHeight:(CGFloat)height menuColor:(UIColor *)color backBlurStyle:(UIBlurEffectStyle)style {
    self = [super init];
    if (self) {
        keyWindow = [UIApplication sharedApplication].keyWindow;
        blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:style]];
        blurView.frame = keyWindow.frame;
        blurView.alpha = 0;
        
        // 两个辅助视图的创建
        helperSideView = [[UIView alloc] initWithFrame:CGRectMake(-40, 0, 40, 40)];
        helperSideView.backgroundColor = [UIColor redColor];
//        helperSideView.hidden = YES;
        [keyWindow addSubview:helperSideView];
        
        helperCenterView = [[UIView alloc]initWithFrame:CGRectMake(-40, CGRectGetHeight(keyWindow.frame)/2 - 20, 40, 40)];
        helperCenterView.backgroundColor = [UIColor yellowColor];
//        helperCenterView.hidden = YES;
        [keyWindow addSubview:helperCenterView];
        
        self.frame = CGRectMake(-keyWindow.frame.size.width * 0.5 - menuBlankWidth, 0, keyWindow.frame.size.width * 0.5 + menuBlankWidth, keyWindow.frame.size.height);
        self.backgroundColor = [UIColor clearColor];
        [keyWindow insertSubview:self belowSubview:helperSideView];
        
        menuColor = color;
        menuButtonHeight = height;
        
        [self addButtonsWithTitles:titles];
    }
    return self;
}

- (void)addButtonsWithTitles:(NSArray *)titles {
    if (titles.count % 2 == 0) {
//        NSInteger index_down = titles.count * 0.5;
//        NSInteger index_up = -1;
        
    } else {
        
    }
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width - menuBlankWidth, 0)];
    CGPoint controlPoint = CGPointMake(keyWindow.frame.size.width * 0.5 + diff, keyWindow.frame.size.height * 0.5);
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width - menuBlankWidth, self.frame.size.height) controlPoint: controlPoint];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [path closePath];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path.CGPath);
    [menuColor set];
    CGContextFillPath(context);
}

- (void)triggerGooeyAnimation {
    if (!triggered) {
        [keyWindow insertSubview:blurView belowSubview:self];
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = self.bounds;
        }];
        
        [self prepareToAnimation];
        [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.9 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
            helperSideView.center = CGPointMake(keyWindow.center.x, helperSideView.frame.size.height * 0.5);
        } completion:^(BOOL finished) {
            [self finishAnimation];
        }];
        
        [UIView animateWithDuration:0.3 animations:^{
            blurView.alpha = 1.0f;
        }];
        
        [self prepareToAnimation];
        [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
            helperCenterView.center = keyWindow.center;
        } completion:^(BOOL finished) {
            if (finished) {
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(untrigger)];
                [blurView addGestureRecognizer:tap];
                [self finishAnimation];
            }
        }];
        
        triggered = YES;
    } else {
        [self untrigger];
    }
}

- (void)untrigger {
    
}

- (void)prepareToAnimation {
    if (!self.displayLink) {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction:)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    self.animationCount ++;
}

- (void)finishAnimation {
    self.animationCount --;
    if (self.animationCount == 0) {
        [self .displayLink invalidate];
        self.displayLink = nil;
    }
}

- (void)displayLinkAction:(CADisplayLink *)displayLink {
    CALayer *sideHelperPresentationLayer = (CALayer *)[helperSideView.layer presentationLayer];
    CALayer *centerHelperPresentationLayer =  (CALayer *)[helperCenterView.layer presentationLayer];
    
    CGRect centerRect = [[centerHelperPresentationLayer valueForKeyPath:@"frame"]CGRectValue];
    CGRect sideRect = [[sideHelperPresentationLayer valueForKeyPath:@"frame"]CGRectValue];
    
    diff = sideRect.origin.x - centerRect.origin.x;
    
    [self setNeedsDisplay];
}

@end
