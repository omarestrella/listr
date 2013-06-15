//
//  ListDataSource.m
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "ListDataSource.h"

@implementation ListDataSource

+ (ListDataSource *)create {
    ListDataSource *instance = [[self alloc] init];
    instance.store = [NSUbiquitousKeyValueStore defaultStore];
    return instance;
}

- (void)addListWithName:(NSString *)name {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    if(!cell) {
        cell = [UITableViewCell new];
    }
    
    cell.textLabel.text = @"List Title";
    
    return cell;
}

@end
