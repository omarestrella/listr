//
//  ListDataStore.m
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "ListDataStore.h"

@implementation ListDataStore

- (void)createListWithName:(NSString *)name {
    List *list = [[List alloc] init];
    list.name = name;
    [list save];
}

- (NSInteger)getListCount {
    return [List count];
}

- (List *)getListAtIndexPath:(NSIndexPath *)indexPath {
    return [List listAtIndex:indexPath.row];
}

- (NSOrderedSet *)getListItemsForList:(List *)list {
    return [list listItems];
}

@end
