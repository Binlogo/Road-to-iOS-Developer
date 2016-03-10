//
//  MusicManager.m
//  MusicDemo
//
//  Created by FellowPlus-Binboy on 2/5/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import "MusicManager.h"

@implementation MusicManager

+ (instancetype)sharedManager
{
    static MusicManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MusicManager alloc] init];
        manager.musicArray = @[].mutableCopy;
    });
    
    return manager;
}

@end
