//
//  ListItemTableView.m
//  Listr
//
//  Created by Omar Estrella on 6/21/13.
//  Copyright (c) 2013 Omar Estrella. All rights reserved.
//

#import "ListItemTableView.h"

@implementation ListItemTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}

@end
