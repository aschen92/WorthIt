//
//  StoriesViewController.m
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "StoriesViewController.h"
#import "StoryCell.h"
#import "StoryDetailViewController.h"

@interface StoriesViewController ()

@end

@implementation StoriesViewController

- (void)addNewItem:(id)sender
{
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    StoryDetailViewController *storyDetailViewController = [[StoryDetailViewController alloc] initForNewItem:YES];
    [storyDetailViewController setItem:newItem];
    
    [StoryDetailViewController setDismissBlock:^{
        [[self tableView] reloadData];
    }];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    
    [navController setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentViewController:navController animated:YES completion:nil];

}

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        
    
        UINavigationItem *n = [self navigationItem];
        [n setTitle:@"Stories"];
    
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 0.01f)];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
        [[self navigationItem] setRightBarButtonItem:bbi];
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    
    
    
//    NSBundle *appBundle = [NSBundle mainBundle];
//    self = [super initWithNibName:@"StoriesViewController" bundle:appBundle];
//    if (self) {
//        UITabBarItem *tbi = [self tabBarItem];
//        [tbi setTitle:@"Stories"];
//        UIImage *i = [UIImage imageNamed:@"Time.png"];
//        [tbi setImage:i];
    
        
    }
    return self;
}

- (void)viewDidLoad
{
    //customization
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
