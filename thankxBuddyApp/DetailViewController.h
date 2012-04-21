//
//  DetailViewController.h
//  thankxBuddyApp
//
//  Created by Benyam Solomon on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
    NSDictionary *selectedItem;
}

@property (nonatomic, retain) NSDictionary *selectedItem;

@end
