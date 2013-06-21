//
//  ListItemDataSource.m
//  Listr
//
//  Created by Omar Estrella on 6/16/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "ListItemDataSource.h"

#import "ListItem.h"

@implementation ListItemDataSource

+ (ListItemDataSource *)create {
    ListItemDataSource *instance = [[self alloc] init];
    instance.store = [ListDataStore new];
    return instance;
}

- (void)setCurrentList:(List *)list {
    self.list = list;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.list listItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListItemCell"];
    if(!cell) {
        cell = [UITableViewCell new];
    }
    
    ListItem *listItem = [[self.list listItems] objectAtIndex:indexPath.row];
    cell.textLabel.text = listItem.content;
    
    return cell;
}

@end
