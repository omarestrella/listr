//
//  ListContentTableViewController.m
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "FontAwesomeKit.h"

#import "ListContentTableViewController.h"
#import "ListItem.h"

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
    [self updateTextFieldView];
    
    if(!self.dataSource) {
        self.dataSource = [ListItemDataSource create];
    }
    
    [self.viewDeckController setDelegate:self];
    [self.itemTextField setDelegate:self];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self.dataSource];
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

- (void)updateTextFieldView {
    float padding = [[UITableViewCell new] indentationWidth];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, 20)];
    self.itemTextField.leftView = paddingView;
    self.itemTextField.leftViewMode = UITextFieldViewModeAlways;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *listItemContent = textField.text;
    
    if(!self.list) {
        NSLog(@"No list to be found");
        return FALSE;
    }
    
    if(listItemContent) {
        ListItem *listItem = [ListItem initWithContent:listItemContent andList:self.list];
        self.itemTextField.text = @"";
        [listItem save];
        
        int index = [self.list.listItems count] - 1;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    return TRUE;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.itemTextField endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didEndEditingRowAtIndexPath:indexPath];
    [tableView setEditing:NO];
}

- (IBAction)revealSidebar:(UIBarButtonItem *)sender {
    [self.viewDeckController.view endEditing:YES];
    
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController didBounceViewSide:(IIViewDeckSide)viewDeckSide closingController:(UIViewController *)closingController {
    if(self.list) {
        [self.navigationItem setTitle:self.list.name];
        [self.dataSource setList:self.list];
        [self.tableView reloadData];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
}

@end
