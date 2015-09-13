//
//  LanguageListController.h
//  Presidents
//
//  Created by brother on 15/8/25.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface LanguageListController : UITableViewController

@property (weak, nonatomic) DetailViewController *detailViewController;
@property (copy, nonatomic) NSArray *languageNames;
@property (copy, nonatomic) NSArray *languageCodes;

@end
