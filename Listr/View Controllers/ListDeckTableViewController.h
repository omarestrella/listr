//
//  ListDeckTableViewController.h
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ListDataSource.h"

@interface ListDeckTableViewController : UITableViewController <UITableViewDelegate> {
    ListDataSource<UITableViewDataSource> *dataSource;
}

@end
