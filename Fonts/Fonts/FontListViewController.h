//
//  FontListViewController.h
//  Fonts
//
//  Created by brother on 15/8/13.
//  Copyright (c) 2015年 brother. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontListViewController : UITableViewController

@property (copy, nonatomic) NSArray *fontNames;
@property (assign, nonatomic) BOOL showFavorites;

@end
