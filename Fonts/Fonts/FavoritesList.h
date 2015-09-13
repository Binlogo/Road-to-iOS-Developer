//
//  FavoritesList.h
//  Fonts
//
//  Created by brother on 15/8/13.
//  Copyright (c) 2015年 brother. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesList : NSObject

+ (instancetype)sharedFavoritesList;

- (NSArray *)favorites;

- (void)addFavorite:(id)item;
- (void)removeFavorite:(id)item;

@end
