//
//  ListItem.h
//  Listr
//
//  Created by Omar Estrella on 6/16/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <SSManagedObject.h>

#import "List.h"

@interface ListItem : SSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSManagedObject *list;

+ (ListItem *)initWithContent:(NSString *)content andList:(List *)list;

@end
