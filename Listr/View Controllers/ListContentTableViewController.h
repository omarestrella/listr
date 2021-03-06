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

@interface ListContentTableViewController : UITableViewController <UITableViewDelegate, UITextFieldDelegate, IIViewDeckControllerDelegate> {
    List *list;
    ListItemDataSource *dataSource;
    UIView *pullListView;
    UITextField *pullListTextField;
    BOOL isDragging;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *viewDeckButton;

@property (strong, nonatomic) UIView *pullListView;
@property (strong, nonatomic) UITextField *pullListTextField;

@property (strong, nonatomic) List *list;
@property (strong, nonatomic) ListItemDataSource *dataSource;

- (void)updateListDisplay;

- (IBAction)revealSidebar:(UIBarButtonItem *)sender;

@end
