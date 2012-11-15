//
//  QPNewTaskViewController.h
//  TXRXIntro
//
//  Created by quantum on 11/4/12.
//  Copyright (c) 2012 Quantum Potato Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QPNewTaskProtocol;

@interface QPEditTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (assign, nonatomic) id <QPNewTaskProtocol> delegate;
@property (strong, nonatomic) NSString *task;

- (id)initWithTask:(NSString *)task;

@end

@protocol QPNewTaskProtocol <NSObject>

- (void)taskCreated:(NSString *)task;

@end