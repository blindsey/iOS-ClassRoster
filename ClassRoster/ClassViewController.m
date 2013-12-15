//
//  ClassViewController.m
//  ClassRoster
//
//  Created by Ben Lindsey on 12/14/13.
//  Copyright (c) 2013 Ben Lindsey. All rights reserved.
//

#import "ClassViewController.h"

@interface ClassViewController ()

@property (nonatomic, strong) NSArray *students;
@property (nonatomic, strong) NSArray *teachers;

@end

@implementation ClassViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSArray *)students {
    if (_students == nil) {
        _students = @[ @"Alex", @"Dan", @"Nick", @"Tam", @"Adam", @"John", @"Tim D" ];
    }
    return _students;
}

- (NSArray *)teachers {
    if (_teachers == nil) {
        _teachers = @[ @"Ben", @"Tim L" ];
    }
    return _teachers;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [self.students count];
    } else {
        return [self.teachers count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"creating cell at index %d", indexPath.row);

    static NSString *CellIdentifier = @"StudentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    if (indexPath.section == 0) {
        cell.textLabel.text = self.students[indexPath.row];
        cell.detailTextLabel.text = self.students[indexPath.row];
    } else {
        cell.textLabel.text = self.teachers[indexPath.row];
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Students";
    } else {
        return @"Teachers";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}

@end
