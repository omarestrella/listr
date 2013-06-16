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

- (void)createListWithName:(NSString *)name;
- (NSInteger)getListCount;
- (List *)getListAtIndexPath:(NSIndexPath *)indexPath;
- (NSOrderedSet *)getListItemsForList:(List *)list;

@end
