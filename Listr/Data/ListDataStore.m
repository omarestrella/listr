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

- (void)createListItemWithContent:(NSString *)content forList:(List *)list {
    
}

- (NSInteger)getListCount {
    return [List count];
}

- (List *)getListAtIndexPath:(NSIndexPath *)indexPath {
    return [List listAtIndex:indexPath.row];
}

- (void)removeListAtIndexPath:(NSIndexPath *)indexPath {
    List *list = [self getListAtIndexPath:indexPath];
    
    NSManagedObjectContext *context = [list managedObjectContext];
    NSError *error;
    
    [list delete];
    
    if(![context save:&error]) {
        NSLog(@"Error while deleting list: %@", [error userInfo]);
    }
}

- (void)removeListItemAtIndexPath:(NSIndexPath *)indexPath fromList:(List *)list {
    ListItem *listItem = [self getListItemAdIndexPath:indexPath fromList:list];
    
    NSManagedObjectContext *context = [listItem managedObjectContext];
    NSError *error;
    
    [listItem delete];
    
    if(![context save:&error]) {
        NSLog(@"Error while deleting list item: %@", [error userInfo]);
    }
}

- (ListItem *)getListItemAdIndexPath:(NSIndexPath *)indexPath fromList:(List *)list {
    return [[list listItems] objectAtIndex:indexPath.row];
}

- (NSOrderedSet *)getListItemsForList:(List *)list {
    return [list listItems];
}

@end
