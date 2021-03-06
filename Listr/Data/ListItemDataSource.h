//
//  ListItemDataSource.h
//  Listr
//
//  Created by Omar Estrella on 6/16/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ListDataStore.h"

@interface ListItemDataSource : NSObject <UITableViewDataSource>

+ (ListItemDataSource *)create;
- (void)setCurrentList:(List *)list;

@property (nonatomic, strong) ListDataStore *store;
@property (nonatomic, strong) List *list;

@end
