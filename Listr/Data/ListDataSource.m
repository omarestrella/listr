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
    instance.store = [ListDataStore create];
    return instance;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.store getListCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    if(!cell) {
        cell = [UITableViewCell new];
    }
    
    cell.textLabel.text = [[self.store getListAtIndex:indexPath.row] name];
    
    return cell;
}

@end
