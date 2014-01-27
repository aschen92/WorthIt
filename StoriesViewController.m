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
#import "StoryStore.h"
#import "Story.h"

@interface StoriesViewController ()

@end

@implementation StoriesViewController

- (void)addNewItem:(id)sender
{
    
    // THIS IS THE NEXT THING TO WORK ON
    StoryStore *sharedStore = [[StoryStore alloc] init];
    Story *story1 = [[Story alloc] init];
    [sharedStore addItem:story1];
    
    StoryDetailViewController *storyDetailViewController = [[StoryDetailViewController alloc] initWithNewStory:YES];
    [storyDetailViewController setStory:story1];
    [storyDetailViewController setDismissBlock:^{
        [[self tableView] reloadData];
    }];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:storyDetailViewController];
    
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

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"StoryCell" bundle:nil];
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"StoryCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[StoryStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Story *s = [[[StoryStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    StoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryCell"];
    
    [cell setController:self];
    [cell setTableView:tableView];
    
    [[cell storySubject] setText:[s subject]];
    
    //change to an NSDate
    [[cell dateLabel] setText:[s datePosted]];
    return cell;
}



@end
