//
//  ModevUXSecondViewController.m
//  thankxBuddyApp
//
//  Created by Benyam Solomon on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define giveawaysListURL [NSURL URLWithString:@"http://10.23.28.44:5000/products"]

#import "ModevUXSecondViewController.h"
#import "DetailViewController.h"

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
    giveawaysArray = [NSJSONSerialization 
                          JSONObjectWithData:responseData //1
                          options:kNilOptions 
                          error:&error];
        
    
    NSLog(@"givawayarray=%@",giveawaysArray);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [giveawaysArray count];
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
    items = [giveawaysArray objectAtIndex:[indexPath row]];
    NSLog(@"items=%@", items);
    
    title = [items objectForKey:@"descShort"];
    //    title = [[giftsDict objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    [cell.textLabel setText:title];
    
    // http://10.23.28.44:5000/products
    
    NSString *baseUrl = [[NSString alloc] initWithString:@"http://10.23.28.44:5000"];
    NSString *itemUrl = [items objectForKey:@"img"];
    NSString *theImageUrl = [[NSString alloc] initWithFormat:@"%@%@", baseUrl, itemUrl];
    
    UIImage *tn = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:theImageUrl]]];
    
    //UIImage *tn = [UIImage imageWithData:[managedObject valueForKey:@"thumbnail"]];
    cell.imageView.image = tn; 
    
//    cell.imageView.image = [items objectForKey:@"img"];
   // cell.textLabel.font = font;
    
    //[currentItemDict release];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.selectedItem = [giveawaysArray objectAtIndex:[indexPath row]];
     
//     [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
