//
//  QPNewTaskViewController.h
//  TXRXIntro
//
//  Created by quantum on 11/4/12.
//  Copyright (c) 2012 Quantum Potato Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QPTask.h"

@protocol QPNewTaskProtocol;

@interface QPEditTaskViewController : UIViewController <UITextFieldDelegate> {

}

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (assign, nonatomic) id <QPNewTaskProtocol> delegate;
@property (strong, nonatomic) QPTask *task;

- (id)initWithTask:(QPTask *)task;

@end

@protocol QPNewTaskProtocol <NSObject>

- (void)taskCreated:(QPTask *)task;
- (void)taskEdited:(QPTask *)task;
- (void)cancelledEditingTask:(QPTask *)task;

@end


