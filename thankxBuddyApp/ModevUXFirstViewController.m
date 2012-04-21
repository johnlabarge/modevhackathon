//
//  ModevUXFirstViewController.m
//  thankxBuddyApp
//
//  Created by Benyam Solomon on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#define giftsListURL [NSURL URLWithString:@"http://10.23.28.44:5000/messages"]

#import "ModevUXFirstViewController.h"


@implementation ModevUXFirstViewController

@synthesize giftsTableView;
@synthesize giftsDict;
@synthesize goodiesArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"My Goodies", @"My Goodies");
        self.tabBarItem.image = [UIImage imageNamed:@"gifts"];
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
                        giftsListURL];
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
    goodiesArray = [NSJSONSerialization 
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions 
                          error:&error];
    
//    NSLog(@"goodies=%@", goodiesArray);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [goodiesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UIFont   *font    = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *title;
    
    
    NSDictionary *items = [[NSDictionary alloc] init];
    items = [goodiesArray objectAtIndex:[indexPath row]];
    NSLog(@"GOODIES=%@", goodiesArray);
    
    title = [items objectForKey:@"to"];
    
    [cell.textLabel setText:title];
    //    cell.imageView.image = [items objectForKey:@"img"];

    cell.textLabel.font = font;
    
    //[currentItemDict release];

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
