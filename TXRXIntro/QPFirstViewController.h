//
//  QPFirstViewController.h
//  TXRXIntro
//
//  Created by quantum on 11/4/12.
//  Copyright (c) 2012 Quantum Potato Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QPEditTaskViewController.h"

@interface QPFirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, QPNewTaskProtocol> {
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *actionItems;


@end
