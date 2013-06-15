//
//  ListDataSource.h
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ListDataStore.h"

@interface ListDataSource : NSObject <UITableViewDataSource>

+ (ListDataSource *)create;

@property (nonatomic, strong) ListDataStore *store;

@end
