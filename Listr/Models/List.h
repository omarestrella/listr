//
//  List.h
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface List : NSObject

+ (List *)initWithName:(NSString *)name andId:(NSString *)_id;

@property (nonatomic) NSString *_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *listItems;

@end
