//
//  List.h
//  Listr
//
//  Created by Omar Estrella on 6/16/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <SSManagedObject.h>

@class ListItem;

@interface List : SSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSOrderedSet *listItems;

+ (List *)initWithName:(NSString *)name;
+ (NSInteger)count;
+ (List *)listAtIndex:(NSInteger)index;

@end

@interface List (CoreDataGeneratedAccessors)

- (void)insertObject:(ListItem *)value inListItemsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromListItemsAtIndex:(NSUInteger)idx;
- (void)insertListItems:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeListItemsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInListItemsAtIndex:(NSUInteger)idx withObject:(ListItem *)value;
- (void)replaceListItemsAtIndexes:(NSIndexSet *)indexes withListItems:(NSArray *)values;
- (void)addListItemsObject:(ListItem *)value;
- (void)removeListItemsObject:(ListItem *)value;
- (void)addListItems:(NSOrderedSet *)values;
- (void)removeListItems:(NSOrderedSet *)values;

@end
