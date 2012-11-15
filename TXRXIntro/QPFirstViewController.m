//
//  QPFirstViewController.m
//  TXRXIntro
//
//  Created by quantum on 11/4/12.
//  Copyright (c) 2012 Quantum Potato Software. All rights reserved.
//

#import "QPFirstViewController.h"
#import "QPTask.h"

@implementation QPFirstViewController
@synthesize tableView = _tableView;
@synthesize actionItems = _actionItems;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"List";
    }
    return self;
}

#pragma mark UISetup

- (void)setupActionItems {
    self.actionItems = [QPTask savedTasks];
    
//    self.actionItems = [NSMutableArray array];
//    QPTask *t1 = [[QPTask alloc] initWithTask:@"Learn Objective-C"];
//    QPTask *t2 = [[QPTask alloc] initWithTask:@"Write a test application"];
//    
//    [self.actionItems addObject:t1];
//    [self.actionItems addObject:t2];
}

- (void)newTapped {
    NSLog(@"new button tapped");
    QPEditTaskViewController *vc = [[QPEditTaskViewController alloc] initWithTask:nil];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setupNavigationButtons {
    UIBarButtonItem *newButton = [[UIBarButtonItem alloc] initWithTitle:@"New"
                                                                  style:UIBarButtonItemStyleBordered
                                                                 target:self
                                                                 action:@selector(newTapped)];
    
    self.navigationItem.rightBarButtonItem = newButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupActionItems];
    [self setupNavigationButtons];

    NSDictionary *john = @{@"name" : @"John", @"occupation" : @"Programmer", @"Hobbies" : @[@"Fishing", @"Building Hackerspaces"]};
    NSDictionary *sam = @{@"name" : @"sam", @"occupation" : @"Lawyer"};

    
    NSDictionary *peopleAndPlaces = @{@"people" : @[john, sam], @"places": @[@"Houston", @"Dallas", @"Austin"]};
    NSLog(@"peopleAndPlaces: \n %@", peopleAndPlaces);
    
    
    
    
    NSArray *folks = @[john, sam];
    for (int i = 0; i < folks.count; i++) {
        NSDictionary *personDictionary = [folks objectAtIndex:i];
        NSArray *keys = [personDictionary allKeys];
        for (NSString *key in keys) {
            NSLog(@"key: %@ value: %@", key, [personDictionary objectForKey:key]);
        }
    }

}

#pragma mark QPTaskProtocol

- (void)taskCreated:(QPTask *)task {
    [self.actionItems addObject:task];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
    [QPTask saveTasks:self.actionItems];
}

- (void)taskEdited:(QPTask *)task {
    [self.navigationController popViewControllerAnimated:YES];
    [self.tableView reloadData];
    [QPTask saveTasks:self.actionItems];    
}

- (void)cancelledEditingTask:(QPTask *)task {
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark Tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.actionItems.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (QPTask *)taskForIndexPath:(NSIndexPath *)indexPath {
    return [self.actionItems objectAtIndex:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"actionItemCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self taskForIndexPath:indexPath].task;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    QPTask *t = [self.actionItems objectAtIndex:indexPath.row];
    
    QPEditTaskViewController *vc = [[QPEditTaskViewController alloc] initWithTask:t];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
    NSLog(@"section: %d row: %d",indexPath.section, indexPath.row);
}

@end
