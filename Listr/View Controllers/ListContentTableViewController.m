//
//  ListContentTableViewController.m
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "FontAwesomeKit.h"

#import "ListContentTableViewController.h"

@interface ListContentTableViewController ()

@end

@implementation ListContentTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setButtonIcon];
    
    [self.viewDeckController setDelegate:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setButtonIcon {
    UIImage *listImage = [FontAwesomeKit imageForIcon:FAKIconList
                                            imageSize:CGSizeMake(28, 28)
                                             fontSize:24
                                           attributes:nil];
    self.viewDeckButton.image = listImage;
}

- (IBAction)revealSidebar:(UIBarButtonItem *)sender {
    [self.viewDeckController.view endEditing:YES];
    
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController didBounceViewSide:(IIViewDeckSide)viewDeckSide closingController:(UIViewController *)closingController {
    if(self.list) {
        [self.navigationItem setTitle:self.list.name];
        [self.tableView reloadData];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
}

@end
