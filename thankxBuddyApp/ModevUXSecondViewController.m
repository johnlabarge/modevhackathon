//
//  ModevUXSecondViewController.m
//  thankxBuddyApp
//
//  Created by Benyam Solomon on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define giveawaysListURL [NSURL URLWithString:@"http://api.remix.bestbuy.com/v1/products(manufacturer=motorola)?apiKey=gcbrumxjpnwp2tg3ebhss933&format=json&sort=name.asc"]

#import "ModevUXSecondViewController.h"
#import "DetailViewController.h"

@implementation ModevUXSecondViewController

@synthesize navigationController;

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
    
    navigationController = [[UINavigationController alloc] init];
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
    NSDictionary *productList = [NSJSONSerialization 
                          JSONObjectWithData:responseData //1
                          options:kNilOptions 
                          error:&error];
        
    
    giveawaysArray = [productList objectForKey:@"products"];
//    NSLog(@"givawayarray=%@",giveawaysArray);
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
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *title;
    
    
    NSDictionary *items = [[NSDictionary alloc] init];
    items = [giveawaysArray objectAtIndex:[indexPath row]];
    NSLog(@"items=%@", items);
    
    title = [items objectForKey:@"name"];
    
    [cell.textLabel setText:title];
    
    /*
    // http://10.23.28.44:5000/products
    
    NSString *baseUrl = [[NSString alloc] initWithString:@"http://10.24.110.253:5000"];
    NSString *itemUrl = [items objectForKey:@"thumbnailImage"];
    NSString *theImageUrl = [[NSString alloc] initWithFormat:@"%@%@", baseUrl, itemUrl];
    */
    
    NSString *thumbnailImage = [items objectForKey:@"thumbnailImage"];
    
    UIImage *tn = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:thumbnailImage]]];
    
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
     
//     [navigationController pushViewController:detailViewController animated:YES];
    
}

@end
