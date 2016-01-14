//
//  GameScene.m
//  TextShooter
//
//  Created by brother on 15/8/29.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "LevelScene.h"

@implementation LevelScene

+ (instancetype)sceneWithSize:(CGSize)size levelNumber:(NSUInteger)levelNumber {
    return [[self alloc] initWithSize:size levelNumber:levelNumber];
}

- (instancetype)initWithSize:(CGSize)size {
    return [self initWithSize:size levelNumber:1];
}

- (instancetype)initWithSize:(CGSize)size levelNumber:(NSUInteger)levelNumber {
    if (self = [super initWithSize:size]) {
        _levelNumber = levelNumber;
        _playerLives = 5;
        
        self.backgroundColor = [SKColor whiteColor];
        
        SKLabelNode *lives = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        lives.fontSize = 16;
        lives.fontColor = [SKColor blackColor];
        lives.name = @"LiveLabel";
        lives.text = [NSString stringWithFormat:@"Lives:%lu",(unsigned long) _playerLives];
        lives.horizontalAlignmentMode = SKLabelVerticalAlignmentModeTop;
        lives.verticalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
        lives.position = CGPointMake(self.frame.size.width, self.frame.size.height);
        [self addChild:lives];
        
        SKLabelNode *level = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        level.fontSize = 16;
        level.fontColor = [SKColor blackColor];
        level.name = @"LevelLabel";
        level.text = [NSString stringWithFormat:@"Level:%lu",(unsigned long) _levelNumber];
        level.horizontalAlignmentMode = SKLabelVerticalAlignmentModeTop;
        level.verticalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        level.position = CGPointMake(self.frame.size.width, self.frame.size.height);
        [self addChild:level];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    _levelNumber = 1;
    _playerLives = 5;
    
    self.backgroundColor = [SKColor whiteColor];
    
    SKLabelNode *lives = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
    lives.fontSize = 16;
    lives.fontColor = [SKColor blackColor];
    lives.name = @"LiveLabel";
    lives.text = [NSString stringWithFormat:@"Lives:%lu",(unsigned long) _playerLives];
    lives.horizontalAlignmentMode = SKLabelVerticalAlignmentModeTop;
    lives.verticalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    lives.position = CGPointMake(self.frame.size.width, self.frame.size.height);
    [self addChild:lives];
    
    SKLabelNode *level = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
    level.fontSize = 16;
    level.fontColor = [SKColor blackColor];
    level.name = @"LevelLabel";
    level.text = [NSString stringWithFormat:@"Level:%lu",(unsigned long) _levelNumber];
    level.horizontalAlignmentMode = SKLabelVerticalAlignmentModeTop;
    level.verticalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    level.position = CGPointMake(self.frame.size.width, self.frame.size.height);
    [self addChild:level];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
