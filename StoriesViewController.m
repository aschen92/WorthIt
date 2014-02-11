//
//  StoriesViewController.m
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "StoriesViewController.h"
#import "HomeViewController.h"
#import "StoryCell.h"
#import "StoryDetailViewController.h"
#import "StoryStore.h"
#import "Story.h"
#import "NewStoryViewController.h"

@interface StoriesViewController () <FBLoginViewDelegate>
@end

@implementation StoriesViewController
@synthesize tableView = _tableView;
@synthesize bbi;


#pragma mark - Set-up stuff

- (id)init
{
    self = [super initWithNibName:@"StoriesViewController" bundle:nil];
    if (self) {
        UINavigationItem *nav = [self navigationItem];
        [nav setTitle:@"Stories"];
        [[[self navigationController] navigationBar] setHidden:NO];
        
        bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
        [[self navigationItem] setRightBarButtonItem:bbi];
        //[[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        
    }
    
    return self;
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    bbi.enabled = NO;
}


#pragma mark - Button methods


- (void)addNewItem:(id)sender
{
    Story *story = [[StoryStore sharedStore] createStory];
    
    NewStoryViewController *newStoryViewController = [[NewStoryViewController alloc] init];
    
    [newStoryViewController setStory:story];
    [newStoryViewController setDismissBlock:^{
        [[self tableView] reloadData];
    }];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:newStoryViewController];
    [navController setModalPresentationStyle:UIModalPresentationFormSheet];
    
    [self presentViewController:navController animated:YES completion:nil];
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[StoryStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Story *story = [[[StoryStore sharedStore] allItems]
                  objectAtIndex:[indexPath row]];
    
    
    NSString *uniqueIdentifier = @"StoryCell";
    StoryCell *cell = nil;
    cell = (StoryCell *) [self.tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
    if (!cell) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"StoryCell" owner:nil options:nil];
        for (id currentObject in topLevelObjects)
        {
            cell = (StoryCell *)currentObject;
            break;
        }
    }
    
    NSString *author = [[NSString alloc] initWithFormat:@"Shared by: %@", [story author]];
    
    [[cell authorLabel] setText:author];
    [[cell storySubject] setText:[story subject]];
    [[cell dateLabel] setText:[story datePosted]];
    [[cell profilePicture] setImage:[story thumbnail]];
    
    [cell setController:self];
    [cell setTableView:tableView];
    
    return cell;
}

#pragma mark - Optional overrides

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshInvoked:forState:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}

- (void)refreshInvoked:(id)sender forState:(UIControlState)state
{
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoryDetailViewController *storyDetailViewController = [[StoryDetailViewController alloc] init];
    Story *selectedStory = [[[StoryStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    
    [storyDetailViewController setStory:selectedStory];
    
    [[self navigationController] pushViewController:storyDetailViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}



@end
