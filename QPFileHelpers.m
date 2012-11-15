//
//  QPFileHelpers.m
//  MileageTracker
//
//  Created by quantum on 11/4/12.
//  Copyright (c) 2012 Quantum Potato Software. All rights reserved.
//

#import "QPFileHelpers.h"

@implementation QPFileHelpers

+ (BOOL)fileExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (NSString *)documentsPathWithPath:(NSString *)path {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:path];
}

+ (BOOL)documentsFileExistsWithPath:(NSString *)fileName {
    fileName = [self documentsPathWithPath:fileName];
    return [self fileExistsAtPath:fileName];
}

@end
