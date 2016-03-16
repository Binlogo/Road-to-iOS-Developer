//
//  GooeySlideMenu.h
//  GooeySlideMenuDemo
//
//  Created by Binboy on 3/15/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MenuButtonClickedBlock)(NSInteger index, NSString *title, NSInteger titleCount);

@interface GooeySlideMenu : UIView

/**
 *  Callback of Menu Button Clicked
 */
@property (copy, nonatomic) MenuButtonClickedBlock menuClickedBlock;

/**
 *  Convenient init Method
 *
 *  @param titles Menu Options
 *
 *  @return Object
 */
- (instancetype)initWithTitles:(NSArray *)titles;

/**
 *  Custom init Method
 *
 *  @param titles Menu Options
 *
 *  @return Object
 */
- (instancetype)initWithTitles:(NSArray *)titles buttonHeight:(CGFloat)height menuColor:(UIColor *)color backBlurStyle:(UIBlurEffectStyle)style;

/**
 *  Method to Trigger the Animation
 */
- (void)triggerGooeyAnimation;

@end
