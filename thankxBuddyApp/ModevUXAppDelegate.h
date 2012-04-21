//
//  ModevUXAppDelegate.h
//  thankxBuddyApp
//
//  Created by Benyam Solomon on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModevUXAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate> {
    UINavigationController *navigationController;
    UITabBarController *tabBarController;

}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
