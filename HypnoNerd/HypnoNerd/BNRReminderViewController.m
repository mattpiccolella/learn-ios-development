//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Matt on 3/14/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (IBAction)addReminder:(id) sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        UITabBarItem *tbi = self.tabBarItem;
        
        tbi.title = @"Reminder";
        
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"BNRReminderViewController loaded its view.");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
