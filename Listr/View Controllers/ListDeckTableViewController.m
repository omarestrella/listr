//
//  ListDeckTableViewController.m
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <IIViewDeckController.h>

#import "ListDeckTableViewController.h"
#import "ListContentTableViewController.h"

@interface ListDeckTableViewController ()

@end

@implementation ListDeckTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!self.dataSource) {
        self.dataSource = [ListDataSource create];
    }
    
    [self.tableView setDataSource:self.dataSource];
    [self.tableView setDelegate:self];
    
    [self.listTextField setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *listName = textField.text;
    if(listName.length) {
        [List initWithName:listName];
        self.listTextField.text = @"";
        [self.tableView reloadData];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"The list couldn't be saved"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return FALSE;
    }
    
    return TRUE;
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didEndEditingRowAtIndexPath:indexPath];
    [tableView setEditing:NO];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.listTextField endEditing:YES];
    
    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
        if([controller.centerController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navController = (UINavigationController *)controller.centerController;
            ListContentTableViewController *contentController = [navController.childViewControllers objectAtIndex:0];
            contentController.list = [List listAtIndex:indexPath.row];
            NSLog(@"Clicked list, moving to center");
        }
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
@end
