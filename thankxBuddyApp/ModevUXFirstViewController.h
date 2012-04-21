//
//  ModevUXFirstViewController.h
//  thankxBuddyApp
//
//  Created by Benyam Solomon on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModevUXFirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

    UITableView *giftsTableView;
    NSDictionary *giftsDict;

}

@property (nonatomic, retain) UITableView *giftsTableView;
@property (nonatomic, retain) NSDictionary *giftsDict;

@end
