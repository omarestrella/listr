//
//  ListDeckTableViewController.h
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ListDataSource.h"

@interface ListDeckTableViewController : UITableViewController <UITableViewDelegate, UITextFieldDelegate> {
    ListDataStore *store;
}

@property (weak, nonatomic) IBOutlet UITextField *listTextField;
@property (strong, nonatomic) ListDataSource<UITableViewDataSource> *dataSource;

@end
