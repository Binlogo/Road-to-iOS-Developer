//
//  CircleLayer.m
//  AnimatedCircleDemo
//
//  Created by Binboy on 3/15/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import "CircleLayer.h"
#import <UIKit/UIKit.h>

#define outsideRectSize 90

typedef NS_ENUM(NSInteger, MovingPoint) {
    MovingPoint_D,
    MovingPoint_B
};

@interface CircleLayer ()

/**
 *  外接矩形
 */
@property (assign, nonatomic) CGRect outsideRect;

/**
 *  记录上一次进度，方便根据差值计算出滑动方向
 */
@property (assign, nonatomic) CGFloat lastPregress;

/**
 *  实时记录滑动方向
 */
@property (assign, nonatomic) MovingPoint movePoint;

@end

@implementation CircleLayer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lastPregress = 0.5;
    }
    return self;
}

- (instancetype)initWithLayer:(CircleLayer *)layer {
    self = [super initWithLayer:layer];
    if (self) {
        self.progress = layer.progress;
        self.outsideRect = layer.outsideRect;
        self.lastPregress = layer.lastPregress;
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx {
    // A-C1、B1-C2……的距离，当设置为正方形编程的1/3.6倍时，画出的圆弧完美贴合圆形
    //这个1/3.6倍是怎么得到的呢？
    CGFloat offset = self.outsideRect.size.width / 3.6;
    
    // A、B、C、D实际需要移动的距离，系数为滑块偏离中点0.5的绝对值再乘以2，当滑到两端的时候，movedDistance为最大值：外接矩形宽度的1/5。
    CGFloat movedDistance = (self.outsideRect.size.width / 6.f) * fabs(self.progress - 0.5) * 2;
    
    // 先计算出外接矩形的中心坐标
    CGFloat rectCenterX = self.outsideRect.origin.x + self.outsideRect.size.width * 0.5;
    CGFloat rectCenterY = self.outsideRect.origin.y + self.outsideRect.size.height * 0.5;
    
    // 计算各点坐标
    CGPoint pointA = CGPointMake(rectCenterX, self.outsideRect.origin.y + movedDistance);
    CGPoint pointB = CGPointMake(self.movePoint == MovingPoint_D ? rectCenterX +self.outsideRect.size.width * 0.5 : rectCenterX + self.outsideRect.size.width * 0.5 + movedDistance * 2, rectCenterY);
    CGPoint pointC = CGPointMake(rectCenterX, rectCenterY + self.outsideRect.size.height * 0.5 - movedDistance);
    CGPoint pointD = CGPointMake(self.movePoint == MovingPoint_D ? self.outsideRect.origin.x - movedDistance * 2 : self.outsideRect.origin.x, rectCenterY);
    
    CGPoint c1 = CGPointMake(pointA.x + offset, pointA.y);
    CGPoint c2 = CGPointMake(pointB.x, self.movePoint == MovingPoint_D ? pointB.y - offset : pointB.y - offset + movedDistance);
    CGPoint c3 = CGPointMake(pointB.x, self.movePoint == MovingPoint_D ? pointB.y + offset : pointB.y + offset - movedDistance);
    CGPoint c4 = CGPointMake(pointC.x + offset, pointC.y);
    
    CGPoint c5 = CGPointMake(pointC.x - offset, pointC.y);
    CGPoint c6 = CGPointMake(pointD.x, self.movePoint == MovingPoint_D ? pointD.y + offset - movedDistance : pointD.y + offset);
    
    CGPoint c7 = CGPointMake(pointD.x, self.movePoint == MovingPoint_D ? pointD.y - offset + movedDistance : pointD.y - offset);
    CGPoint c8 = CGPointMake(pointA.x - offset, pointA.y);
    
    // 绘制外接虚线矩形
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:self.outsideRect];
    CGContextAddPath(ctx, rectPath.CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 1.0);
    CGFloat dash[] = {5.0, 5.0};
    CGContextSetLineDash(ctx, 0.0, dash, 2); // 设置线条为虚线
    CGContextStrokePath(ctx);
    
    // 绘制圆的边界
    UIBezierPath *ovalPath = [UIBezierPath bezierPath];
    [ovalPath moveToPoint:pointA];
    [ovalPath addCurveToPoint:pointB controlPoint1:c1 controlPoint2:c2];
    [ovalPath addCurveToPoint:pointC controlPoint1:c3 controlPoint2:c4];
    [ovalPath addCurveToPoint:pointD controlPoint1:c5 controlPoint2:c6];
    [ovalPath addCurveToPoint:pointA controlPoint1:c7 controlPoint2:c8];
    
    CGContextAddPath(ctx, ovalPath.CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineDash(ctx, 0, NULL, 0);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    // 标记出每个点并连线，方便观察，给所有关键点染色 -- 白色,辅助线颜色 -- 白色
    // 语法糖：字典@{}，数组@[]，基本数据类型封装成对象@234，@12.0，@YES,@(234+12.0)
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    NSArray *points = @[[NSValue valueWithCGPoint:pointA],[NSValue valueWithCGPoint:pointB],[NSValue valueWithCGPoint:pointC],[NSValue valueWithCGPoint:pointD],[NSValue valueWithCGPoint:c1],[NSValue valueWithCGPoint:c2],[NSValue valueWithCGPoint:c3],[NSValue valueWithCGPoint:c4],[NSValue valueWithCGPoint:c5],[NSValue valueWithCGPoint:c6],[NSValue valueWithCGPoint:c7],[NSValue valueWithCGPoint:c8]];
    [self drawPoint:points withContext:ctx];
    
    // 连接辅助线
    UIBezierPath *helperline = [UIBezierPath bezierPath];
    [helperline moveToPoint:pointA];
    [helperline addLineToPoint:c1];
    [helperline addLineToPoint:c2];
    [helperline addLineToPoint:pointB];
    [helperline addLineToPoint:c3];
    [helperline addLineToPoint:c4];
    [helperline addLineToPoint:pointC];
    [helperline addLineToPoint:c5];
    [helperline addLineToPoint:c6];
    [helperline addLineToPoint:pointD];
    [helperline addLineToPoint:c7];
    [helperline addLineToPoint:c8];
    [helperline closePath];
    
    CGContextAddPath(ctx, helperline.CGPath);
    
    CGFloat dash2[] = {2.0, 2.0};
    CGContextSetLineDash(ctx, 0.0, dash2, 2);
    CGContextStrokePath(ctx); // 给辅助线条填充颜色
}

//  ctx字面意思是上下文，你可以理解为一块全局的画布。也就是说，一旦在某个地方改了画布的一些属性，其他任何使用画布的属性的时候都是改了之后的。比如上面在 //1 中把线条样式改成了虚线，那么在下文 //2 中如果不恢复成连续的直线，那么画出来的依然是//1中的虚线样式。

// 在某个point位置画一个点，方便观察运动情况
-(void)drawPoint:(NSArray *)points withContext:(CGContextRef)ctx{
    for (NSValue *pointValue in points) {
        CGPoint point = [pointValue CGPointValue];
        CGContextFillRect(ctx, CGRectMake(point.x - 2,point.y - 2,4,4));
    }
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    if (progress <= 0.5) {
        self.movePoint = MovingPoint_B;
    } else {
        self.movePoint = MovingPoint_D;
    }
    
    self.lastPregress = progress;
    
    CGFloat origin_x = self.position.x - outsideRectSize/2 + (progress - 0.5)*(self.frame.size.width - outsideRectSize);
    CGFloat origin_y = self.position.y - outsideRectSize/2;
    
    self.outsideRect = CGRectMake(origin_x, origin_y, outsideRectSize, outsideRectSize);
    
    [self setNeedsDisplay];}

@end
