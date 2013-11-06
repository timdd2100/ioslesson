//
//  PeopleViewController.h
//  PocketTasks
//
//  Created by timkao on 13/11/6.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleViewController : UITableViewController
                        <NSFetchedResultsControllerDelegate>
{
    NSFetchedResultsController *resultController;
    NSManagedObjectContext *managedObjectContext;
}

-(id) initwithMangedObjectContext:(NSManagedObjectContext *) moc;

@end
