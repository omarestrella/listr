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
    ListDataSource<UITableViewDataSource> *dataSource;
}

@property (weak, nonatomic) IBOutlet UITextField *listTextField;

@end
