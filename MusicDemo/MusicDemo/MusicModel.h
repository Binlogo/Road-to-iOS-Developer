//
//  MusicModel.h
//  MusicDemo
//
//  Created by FellowPlus-Binboy on 2/5/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *singer;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *cachePath;
@property (nonatomic, assign) NSInteger durationTime;
@property (nonatomic, assign) BOOL isFavorite;

@property (nonatomic, copy) NSString *lyricPath;

@end
