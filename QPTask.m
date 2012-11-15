//
//  QPTask.m
//  TXRXIntro
//
//  Created by quantum on 11/14/12.
//  Copyright (c) 2012 Quantum Potato Software. All rights reserved.
//

#import "QPTask.h"
#import "QPFileHelpers.h"

@implementation QPTask
@synthesize task = _task;
@synthesize isNewTask = _isNewTask;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.task = [decoder decodeObjectForKey:@"task"];
        self.isNewTask = [decoder decodeBoolForKey:@"isNewTask"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.task forKey:@"task"];
    [coder encodeBool:self.isNewTask forKey:@"isNewTask"];
}

- (id)initWithTask:(NSString *)task {
    self = [super init];
    if (self) {
        self.task = task;
        self.isNewTask = YES;
    }
    return self;
}

+ (NSMutableArray *)savedTasks {
    BOOL fileExists = [QPFileHelpers documentsFileExistsWithPath:@"tasks"];
    if (fileExists) {
        return [NSMutableArray arrayWithContentsOfFile:[QPFileHelpers documentsPathWithPath:@"tasks"]];
    }
    
    return [NSMutableArray array];
}

+ (void)saveTasks:(NSMutableArray *)tasks {
    [tasks writeToFile:[QPFileHelpers documentsPathWithPath:@"tasks"] atomically:YES];
}

@end
