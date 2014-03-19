//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Matt on 3/17/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void)loadView {
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

@end
