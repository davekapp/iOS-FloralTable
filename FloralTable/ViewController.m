//
//  ViewController.m
//  FloralTable
//
//  Created by David Kapp on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define kSectionCount 2
#define kRedSection 0
#define kBlueSection 1

@implementation ViewController
@synthesize redFlowers;
@synthesize blueFlowers;


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
  self.redFlowers = [[NSArray alloc] initWithObjects:@"Gerbera", @"Peony", @"Rose", @"Poppy", nil];
  
  self.blueFlowers = [[NSArray alloc] initWithObjects:
                      @"Hyacinth", @"Hydrangea", @"Sea Holly", @"Phlox", @"Iris", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
  [self setRedFlowers:nil];
  [self setBlueFlowers:nil];
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
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return kSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  switch (section) {
    case kRedSection:
      return [self.redFlowers count];
      break;
    case kBlueSection:
      return [self.blueFlowers count];
      break;
      
    default:
      return 0;
      break;
  }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  switch (section) {
    case kRedSection:
      return @"Red Flowers";
      break;
      
    case kBlueSection:
      return @"Blue Ca... Flowers";
      break;
      
    default:
      return @"DOES NOT EXIST YO";
      break;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowerCell"];
  
  switch (indexPath.section) {
    case kRedSection:
      cell.textLabel.text = [self.redFlowers objectAtIndex:indexPath.row];
      break;
      
    case kBlueSection:
      cell.textLabel.text = [self.blueFlowers objectAtIndex:indexPath.row];
      break;      
      
    default:
      cell.textLabel.text = @"Error... DOES NOT EXIST";
      break;
  }
  
  UIImage *image = [UIImage imageNamed:@"halp.png"];
  cell.imageView.image = image;
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *message = nil;
  switch (indexPath.section) {
    case kRedSection:      
      message = [[NSString alloc] initWithFormat:@"That's the red flower %@", [self.redFlowers objectAtIndex:indexPath.row]];
      break;
      
    case kBlueSection:
      message = [[NSString alloc] initWithFormat:@"ZOMG BLUE FLOWER %@!", [self.blueFlowers objectAtIndex:indexPath.row]];
      break;
      
    default:
      message = @"You clicked on something that doesn't exist. That's pretty impressive.";
      break;
  }
  
  UIAlertView *showSelection = [[UIAlertView alloc] initWithTitle:@"Selected Something"
                                             message:message
                                            delegate:self
                                   cancelButtonTitle:@"Ok."
                                   otherButtonTitles:nil];
  [showSelection show];
  // deselect the row, otherwise it stays highlighted... slightly awkward
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

// make the disclosure button do the same thing as the row
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
  [self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end



















