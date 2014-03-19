//
//  BNRCoursesViewController.m
//  Nerdfeed
//
//  Created by Matt on 3/19/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import "BNRCoursesViewController.h"

@interface BNRCoursesViewController ()

@property (nonatomic) NSURLSession *session;
@property (nonatomic, copy) NSMutableArray *repos;

@end

@implementation BNRCoursesViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.repos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
 
    NSDictionary *repo = self.repos[indexPath.row];
    cell.textLabel.text = repo[@"name"];
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"BNR Courses";
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
        
        [self fetchFeed];
    }
    return self;
}

- (void)fetchFeed {
    NSString *requestString = @"https://api.github.com/users/mjp2220/repos";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSMutableArray *myRepos = [[NSMutableArray alloc] init];
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *myData in jsonObject) {
            [myRepos addObject:myData];
        }
        self.repos = myRepos;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
    [dataTask resume];
}

@end
