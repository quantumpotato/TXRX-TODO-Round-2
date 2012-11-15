//
//  QPTask.h
//  TXRXIntro
//
//  Created by quantum on 11/14/12.
//  Copyright (c) 2012 Quantum Potato Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QPTask : NSObject <NSCoding>

@property (strong, nonatomic) NSString *task;
@property (nonatomic) BOOL isNewTask;

- (id)initWithTask:(NSString *)task;

+ (NSMutableArray *)savedTasks;
+ (void)saveTasks:(NSMutableArray *)tasks;

@end
