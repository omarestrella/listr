//
//  ListContentTableViewController.h
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IIViewDeckController.h"

@interface ListContentTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *viewDeckButton;

- (IBAction)revealSidebar:(UIBarButtonItem *)sender;

@end
