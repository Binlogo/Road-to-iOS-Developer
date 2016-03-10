//
//  ViewController.m
//  MusicDemo
//
//  Created by FellowPlus-Binboy on 2/5/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import "ViewController.h"
#import "MusicModel.h"
#import "MusicManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadMusic];
    
}

- (void)loadMusic
{
    MusicModel *music = [[MusicModel alloc] init];
    music.title = @"遇见";
    music.time = @"04:49";
    music.durationTime = 289;
    music.singer = @"孙燕姿";
    music.image = @"yanzi.jpg";
    music.cachePath = [[NSBundle mainBundle] pathForResource:@"遇见" ofType:@"mp3"];
    music.lyricPath = @"遇见";
    
    [[MusicManager sharedManager].musicArray addObject:music];
}

@end
