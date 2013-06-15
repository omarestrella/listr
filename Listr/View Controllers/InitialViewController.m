//
//  InitialViewController.m
//  Listr
//
//  Created by Omar Estrella on 6/15/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *centerController = [storyboard instantiateViewControllerWithIdentifier:@"ListContentTableViewController"];
    UIViewController *leftController = [storyboard instantiateViewControllerWithIdentifier:@"ListDeckTableViewController"];
    
    self = [super initWithCenterViewController:centerController leftViewController:leftController];
    
    if(self) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

@end
