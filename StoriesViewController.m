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



@implementation StoriesViewController
@synthesize tableView = _tableView;


#pragma mark - Set-up stuff

- (id)init
{
    self = [super initWithNibName:@"StoriesViewController" bundle:nil];
    if (self) {
        UINavigationItem *nav = [self navigationItem];
        [nav setTitle:@"Stories"];
        [[[self navigationController] navigationBar] setHidden:NO];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
        [[self navigationItem] setRightBarButtonItem:bbi];
        //[[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
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
    
    
    [[cell storySubject] setText:[story subject]];
    [[cell dateLabel] setText:[story datePosted]];
    [[cell profilePicture] setImage:[story thumbnail]];
    
    [cell setController:self];
    [cell setTableView:tableView];
    
    return cell;
}

#pragma mark - Optional overrides

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
    return 66;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@":P %@", [[StoryStore sharedStore] allItems] );
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[self tableView] reloadData];
    
}



@end
