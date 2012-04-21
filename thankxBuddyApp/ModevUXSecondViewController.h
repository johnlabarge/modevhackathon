//
//  ModevUXSecondViewController.h
//  thankxBuddyApp
//
//  Created by Benyam Solomon on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModevUXSecondViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSDictionary *giveawaysDict;
    UITableView *giveawaysTable;
}

@end
