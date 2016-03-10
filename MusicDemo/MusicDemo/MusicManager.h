//
//  MusicManager.h
//  MusicDemo
//
//  Created by FellowPlus-Binboy on 2/5/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicManager : NSObject

@property (nonatomic, strong) NSMutableArray *musicArray;

+ (instancetype)sharedManager;

@end
