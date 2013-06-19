//
//  ListDeckView.m
//  Listr
//
//  Created by Omar Estrella on 6/18/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import <IIViewDeckController.h>

#import "ListDeckView.h"
#import "ListDeckTableViewController.h"

@implementation ListDeckView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    if(self.delegate) {
        ListDeckTableViewController *controller = (ListDeckTableViewController *)self.delegate;
        float rightLedgeSize = controller.viewDeckController.rightLedgeSize;
        frame.size.width -= rightLedgeSize;
    }
    
    [super setFrame:frame];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
