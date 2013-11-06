//
//  PeopleViewController.m
//  PocketTasks
//
//  Created by timkao on 13/11/6.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "PeopleViewController.h"

@interface PeopleViewController ()

@end

@implementation PeopleViewController

-(id)initwithMangedObjectContext:(NSManagedObjectContext *)moc
{
    if((self = [super initWithStyle:UITableViewStylePlain]))
    {
        managedObjectContext = [moc retain];
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        [request setEntity:[NSEntityDescription entityForName:@"Person" inManagedObjectContext:moc]];
        
        [request setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES]]];
        
        resultController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil];
        
        [request release];
        
        NSError *error = nil;
        
        if(![resultController performFetch:&error])
        {
            NSLog(@"Error while performing fetch: %@", error);
        }
        
    }
    return self;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[resultController sections] count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[resultController sections]objectAtIndex:section]numberOfObjects];
}


-(void) configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *person = [resultController objectAtIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",[person valueForKey:@"firstName"],[person valueForKey:@"lastName"]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i tasks",[[person valueForKey:@"tasks"] count]];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PersonCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
   
    [managedObjectContext release];
    
    [super dealloc];
}

@end
