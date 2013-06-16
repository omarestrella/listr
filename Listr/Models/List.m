//
//  List.m
//  Listr
//
//  Created by Omar Estrella on 6/16/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "List.h"
#import "ListItem.h"


@implementation List

@dynamic name;
@dynamic listItems;

+ (List *)initWithName:(NSString *)name {
    List *instance = [[List alloc] init];
    instance.name = name;
    [instance save];
    return instance;
}

+ (NSArray *)findAllLists {
    NSManagedObjectContext *context = [super mainQueueContext];
    NSError *error;
    
    NSFetchRequest *request = [NSFetchRequest new];
    request.entity = [List entity];
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if(error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    }
    
    return results;
}

+ (NSInteger)count {
    return [[self findAllLists] count];
}

+ (List *)listAtIndex:(NSInteger)index {
    return [[self findAllLists] objectAtIndex:index];
}

@end
