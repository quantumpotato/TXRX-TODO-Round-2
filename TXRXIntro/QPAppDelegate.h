//
//  QPAppDelegate.h
//  TXRXIntro
//
//  Created by quantum on 11/4/12.
//  Copyright (c) 2012 Quantum Potato Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QPAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate > {
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
