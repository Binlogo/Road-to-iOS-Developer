//
//  NSObject+AddProperty.m
//  Category
//
//  Created by FellowPlus-Binboy on 1/14/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import "NSObject+AddProperty.h"
#import <objc/runtime.h>

@implementation NSObject (AddProperty)

- (void)setNewVar:(NSString *)newVar
{
    objc_setAssociatedObject(self, "newVar", newVar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)newVar
{
    return objc_getAssociatedObject(self, "newVar");
}

@end
