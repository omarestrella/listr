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

#define cell_height 36.0f

@implementation ListContentTableViewController

@synthesize dataSource, list, pullListView, pullListTextField;

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
    [self createPullHeader];
    
    if(!dataSource) {
        dataSource = [ListItemDataSource create];
    }
    
    [self.viewDeckController setDelegate:self];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self.dataSource];
    
    [pullListTextField setDelegate:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createPullHeader {
    float width = self.tableView.frame.size.width;
    
    // Theres got to be a better way to do this...
    float padding = [[UITableViewCell new] indentationWidth];
    
    pullListView = [[UIView alloc] initWithFrame:CGRectMake(0, 0 - cell_height , width, cell_height)];
    pullListView.backgroundColor = [UIColor clearColor];
    
    pullListTextField = [[UITextField alloc] initWithFrame:CGRectMake(padding, 0, width - padding, cell_height)];
    pullListTextField.textColor = [UIColor lightGrayColor];
    pullListTextField.font = [UIFont systemFontOfSize:18.0];
    pullListTextField.placeholder = @"New list item...";
    pullListTextField.textAlignment = NSTextAlignmentLeft;
    
    [pullListView addSubview:pullListTextField];
    [self.tableView addSubview:pullListView];
}

- (void)setButtonIcon {
    UIImage *listImage = [FontAwesomeKit imageForIcon:FAKIconList
                                            imageSize:CGSizeMake(28, 28)
                                             fontSize:24
                                           attributes:nil];
    self.viewDeckButton.image = listImage;
}

- (void)updateListDisplay {
    if(self.list) {
        [self.navigationItem setTitle:self.list.name];
        [self.dataSource setList:self.list];
        [self.tableView reloadData];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    isDragging = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(scrollView.contentOffset.y > -cell_height) {
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.contentInset = UIEdgeInsetsZero;
            [pullListTextField resignFirstResponder];
        }];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    isDragging = NO;
    
    if(scrollView.contentOffset.y <= -32.0) {
        [UIView animateWithDuration:0.3 animations:^{
            self.tableView.contentInset = UIEdgeInsetsMake(cell_height, 0, 0, 0);
            [pullListTextField becomeFirstResponder];
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *listItemContent = textField.text;
    
    if(!self.list) {
        NSLog(@"No list to be found");
        return FALSE;
    }
    
    if(listItemContent) {
        ListItem *listItem = [ListItem initWithContent:listItemContent andList:self.list];
        textField.text = @"";
        [listItem save];
        
        int index = [self.list.listItems count] - 1;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        self.tableView.contentInset = UIEdgeInsetsZero;
    }
    
    return TRUE;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.tableView.contentInset = UIEdgeInsetsZero;
    [pullListTextField endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didEndEditingRowAtIndexPath:indexPath];
    [tableView setEditing:NO];
}

- (IBAction)revealSidebar:(UIBarButtonItem *)sender {
    [self.viewDeckController.view endEditing:YES];
    
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
}

@end
