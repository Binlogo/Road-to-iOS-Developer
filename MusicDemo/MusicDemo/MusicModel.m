//
//  MusicModel.m
//  MusicDemo
//
//  Created by FellowPlus-Binboy on 2/5/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import "MusicModel.h"

@implementation MusicModel

- (instancetype)init
{
    if (self = [super init]) {
        self.title = nil;
        self.durationTime = 0;
        self.singer = nil;
        self.image = nil;
        self.time = nil;
        self.lyricPath = nil;
        self.cachePath = nil;
    }
    
    return self;
}

@end
