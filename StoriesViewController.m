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
@synthesize tableView;


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

- (void)viewDidLoad
{
    
}

#pragma mark - Button methods

- (void)done:(id)sender
{
    // Probably don't need this anymore
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)addNewItem:(id)sender
{
    Story *story = [[StoryStore sharedStore] createStory];
    NewStoryViewController *newStoryViewController = [[NewStoryViewController alloc] init];
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
//    return [[[StoryStore sharedStore] allItems] count];
    return [[[StoryStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StoryCell";
    StoryCell *cell = (StoryCell *) [[self tableView] dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"StoryCell" owner:self options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[UITableViewCell class]]) {
                cell = (StoryCell *)currentObject;
                break;
            }
        }
    }
    
    Story *story = [[[StoryStore sharedStore] allItems] objectAtIndex:indexPath.row];
    [[cell storySubject] setText:[story subject]];
    [[cell dateLabel] setText:[story datePosted]];
    [[cell profilePicture] setImage:[story thumbnail]];
    
    return cell;
}

#pragma mark - Optional overrides

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoryDetailViewController *storyDetailViewController = [[StoryDetailViewController alloc] initWithNewStory:NO];
    
    Story *selectedStory = [[[StoryStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    
    [storyDetailViewController setStory:selectedStory];
    
    [[self navigationController] pushViewController:storyDetailViewController animated:YES];
}



@end
