//
//  ListItem.m
//  Listr
//
//  Created by Omar Estrella on 6/16/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

@dynamic content;
@dynamic dateCreated;
@dynamic list;

+ (ListItem *)initWithContent:(NSString *)content andList:(List *)list {
    ListItem *instance = [[ListItem alloc] init];
    instance.content = content;
    instance.dateCreated = [NSDate date];
    instance.list = list;
    return instance;
}

@end
