//
//  ListContentTableViewController.h
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IIViewDeckController.h>

#import "List.h"
#import "ListItemDataSource.h"

@interface ListContentTableViewController : UITableViewController <UITextFieldDelegate, IIViewDeckControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *viewDeckButton;
@property (weak, nonatomic) IBOutlet UITextField *itemTextField;
@property (strong, nonatomic) List *list;
@property (strong, nonatomic) ListItemDataSource *dataSource;

- (IBAction)revealSidebar:(UIBarButtonItem *)sender;

@end
