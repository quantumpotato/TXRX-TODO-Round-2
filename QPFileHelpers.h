//
//  QPFileHelpers.h
//  MileageTracker
//
//  Created by quantum on 11/4/12.
//  Copyright (c) 2012 Quantum Potato Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QPFileHelpers : NSObject {}

+ (BOOL)fileExistsAtPath:(NSString *)fileName;
+ (NSString *)documentsPathWithPath:(NSString *)path;
+ (BOOL)documentsFileExistsWithPath:(NSString *)path;

@end