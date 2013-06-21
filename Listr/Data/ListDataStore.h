//
//  ListDataStore.h
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "List.h"
#import "ListItem.h"

@interface ListDataStore : NSObject

- (void)createListWithName:(NSString *)name;
- (void)createListItemWithContent:(NSString *)content forList:(List *)list;
- (NSInteger)getListCount;
- (List *)getListAtIndexPath:(NSIndexPath *)indexPath;
- (void)removeListAtIndexPath:(NSIndexPath *)indexPath;
- (void)removeListItemAtIndexPath:(NSIndexPath *)indexPath fromList:(List *)list ;
- (NSOrderedSet *)getListItemsForList:(List *)list;

@end
