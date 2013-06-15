//
//  ListDataStore.h
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "List.h"

@interface ListDataStore : NSObject

+ (ListDataStore *)create;
- (void)addListWithName:(NSString *)name;
- (List *)getListAtIndex:(NSInteger)index;
- (List *)getListById:(NSString *)_id;
- (NSInteger)getListCount;

@property (nonatomic, strong) NSUbiquitousKeyValueStore *cloudStore;
@property (nonatomic, strong) NSMutableArray *lists;

@end
