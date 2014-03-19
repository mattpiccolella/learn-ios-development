//
//  BNRItemCell.m
//  Homepwner
//
//  Created by Matt on 3/19/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import "BNRItemCell.h"

@implementation BNRItemCell

- (IBAction)showImage:(id)sender {
    if (self.actionBlock) {
        self.actionBlock();
    }
    
}

@end
