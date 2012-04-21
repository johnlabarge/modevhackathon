//
//  ModevUXSecondViewController.m
//  thankxBuddyApp
//
//  Created by Benyam Solomon on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define giveawaysListURL [NSURL URLWithString:@"http://10.23.28.44:5000/products"]

#import "ModevUXSecondViewController.h"

@implementation ModevUXSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Give Aways", @"Give Aways");
        self.tabBarItem.image = [UIImage imageNamed:@"giveaways"];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // background image for view
//	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.png"]];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSData* data = [NSData dataWithContentsOfURL: 
                        giveawaysListURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) 
                               withObject:data waitUntilDone:YES];
    });
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:responseData //1
                          options:kNilOptions 
                          error:&error];
    
    
    
    
    //    NSLog(@"offerings: %@", offerings);
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{ 
    
    UIView *containerView;
    containerView.frame = CGRectMake(0,0,320,39);
    
    UILabel *headerLabel;
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Table HeaderReduced.png"]];
    // headerLabel.textColor = [UIColor darkGrayColor];
    // headerLabel.text = @"Some title";
    
    [containerView addSubview:headerLabel];
    
    return containerView;
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIImage *rowBackground;
    NSInteger sectionRows = [tableView numberOfRowsInSection:[indexPath section]];
    NSInteger row = [indexPath row];
    if (row == 0 && row == sectionRows - 1)
    {
        rowBackground = [UIImage imageNamed:@"Table Bottom.png"];
    }
    else if (row == 0)
    {
        rowBackground = [UIImage imageNamed:@"Table Middle.png"];
    }
    else if (row == sectionRows - 1)
    {
        rowBackground = [UIImage imageNamed:@"Table Bottom.png"];
    }
    else
    {
        rowBackground = [UIImage imageNamed:@"Table Middle.png"];
    }
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:rowBackground];
    
	cell.textLabel.font = [UIFont fontWithName:@"Futura Medium" size:17];
    //      cell.textLabel.text = promotion.shortDescription;
    //      cell.textLabel.numberOfLines = 2;
    //      cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    //      cell.detailTextLabel.text = @"";
    //     cell.imageView.image = promotion.business.image;
    
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*    
     DetailViewController *detailViewController = [[DetailViewController alloc] init];
     detailViewController.fedType = fedType;
     detailViewController.levelType = levelType;
     detailViewController.tableView = tableView;
     
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
}

@end
