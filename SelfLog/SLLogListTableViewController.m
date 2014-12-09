//
//  SLLogListTableViewController.m
//  SelfLog
//
//  Created by SatoDaisuke on 12/9/14.
//  Copyright (c) 2014 SatoDaisuke. All rights reserved.
//

#import "SLLogListTableViewController.h"
#import "SLLogListCell.h"
#import "SLLog.h"
#import <RLMResults.h>

@interface SLLogListTableViewController ()
{
    RLMResults *logs;
}

@end

@implementation SLLogListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    logs = [SLLog allObjects];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return logs.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SLLogListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SLLogListCell class]) forIndexPath:indexPath];
    
    
    SLLog *log = logs[indexPath.row];
    
    cell.titleLabel.text = log.title;
    cell.postedDateLabel.text = [self stringFromDate:log.postedDate];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

#pragma mark -
-(NSString*)stringFromDate:(NSDate*)date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    
    return [formatter stringFromDate:date];
}


@end
