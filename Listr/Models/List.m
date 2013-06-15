//
//  List.m
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "List.h"
#import "ListItem.h"

@implementation List

- (void)addListItem:(ListItem *)listItem {
    listItem._id = [NSNumber numberWithInt:[self.listItems count]];
    [self.listItems addObject:listItem];
}

@end
