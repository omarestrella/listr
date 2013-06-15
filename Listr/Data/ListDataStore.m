//
//  ListDataStore.m
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "ListDataStore.h"

@implementation ListDataStore

@synthesize lists;

+ (ListDataStore *)create {
    ListDataStore *instance = [[self alloc] init];
    instance.cloudStore = [NSUbiquitousKeyValueStore defaultStore];
    
    if(!instance.lists) {
        instance.lists = [NSMutableArray arrayWithArray:[instance.cloudStore arrayForKey:@"lists"]];
    }
    
    return instance;
}

- (void)addListWithName:(NSString *)name {
    if(name.length > 0) {
        List *list = [List initWithName:name andId:[self getUUID]];
        [self.lists addObject:list];
        [self.cloudStore setArray:self.lists forKey:@"lists"];
    }
}

- (List *)getListAtIndex:(NSInteger)index {
    return [self.lists objectAtIndex:index];
}

- (List *)getListById:(NSString *)_id {
    for(id list in self.lists) {
        List *listObj = (List *)list;
        if([listObj._id isEqualToString:_id]) {
            return listObj;
        }
    }
    
    return nil;
}

- (NSInteger)getListCount {
    return self.lists.count;
}

- (NSString *)getUUID {
    return [[NSUUID UUID] UUIDString];
}

@end
