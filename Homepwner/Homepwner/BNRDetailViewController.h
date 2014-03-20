//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Matt on 3/15/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRItem.h"

@interface BNRDetailViewController : UIViewController <UIViewControllerRestoration>

- (instancetype)initForNewItem:(BOOL)isNew;
@property (nonatomic, strong) BNRItem *item;
@property (nonatomic, copy) void (^dismissBlock)(void);

@end
