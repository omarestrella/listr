//
//  ListDataSource.h
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListDataSource : NSObject <UITableViewDataSource>

+ (ListDataSource *)create;
- (void)addListWithName:(NSString *)name;

@property (nonatomic, strong) NSUbiquitousKeyValueStore *store;

@end