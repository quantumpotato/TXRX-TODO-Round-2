//
//  QPNewTaskViewController.m
//  TXRXIntro
//
//  Created by quantum on 11/4/12.
//  Copyright (c) 2012 Quantum Potato Software. All rights reserved.
//

#import "QPEditTaskViewController.h"

@implementation QPEditTaskViewController
@synthesize textField = _textField;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil task:(QPTask *)task {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.task = task;
    }
    return self;
}

- (id)initWithTask:(QPTask *)task {
    self = [self initWithNibName:[[self class] description] bundle:nil task:task];
    return self;
}

- (void)saveTapped {
    if (!self.task) {
        self.task = [[QPTask alloc] initWithTask:self.textField.text];
        [self.delegate taskCreated:self.task];
    } else {
        self.task.task = self.textField.text;
        [self.delegate taskEdited:self.task];
    }
}

- (void)cancel {
    [self.delegate cancelledEditingTask:self.task];
}

- (void)setupNavButtons {
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(saveTapped)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                     style:UIBarButtonSystemItemDone target:self
                                                                    action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavButtons];
    if (self.task) {
        self.textField.text = self.task.task;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"range.location %d", range.location);
    NSLog(@"range.length: %d", range.length);
    return YES;
}


@end
