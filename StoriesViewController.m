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



@implementation StoriesViewController
@synthesize tableView, items;


#pragma mark - Set-up stuff

- (id)init
{
    self = [super initWithNibName:@"StoriesViewController" bundle:nil];
    if (self) {
        UINavigationItem *nav = [self navigationItem];
        [nav setTitle:@"Stories"];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        
        [[self navigationItem] setRightBarButtonItem:bbi];
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    }
    
    return self;
}

- (void)done:(id)sender
{
    // BAD DESIGN AHHH
    HomeViewController *hvc = [[HomeViewController alloc] init];
    [self presentViewController:hvc animated:YES completion:nil];
}

- (void)viewDidLoad
{
    Story *story1 = [[Story alloc] init];
    NSString *aaronsStory = @"My experience at Wartburg College allowed me to succeed in ways that I never though possible. I had one professor that was willing to offer extra help whenever I needed it. The staff in the business office allowed me to actually figure out my loans so that I could pay it off in a timely manner.";
    [story1 setStoryText:aaronsStory];
    [story1 setSubject:@"Financial Aid"];
    [story1 setDatePosted:@"1/20/14"];
    [story1 setAuthor:@"Aaron"];
    [story1 setThumbnail:[UIImage imageNamed:@"aaron_pic.jpg"]];
    
    Story *story2 = [[Story alloc] init];
    [story2 setStoryText:@"Dr. Zelle's Story Text"];
    [story2 setSubject:@"Athletics helped me through"];
    [story2 setDatePosted:@"1/25/14"];
    [story2 setAuthor:@"Adam"];
    [story2 setThumbnail:[UIImage imageNamed:@"adam_pic.jpg"]];
    
    Story *story3 = [[Story alloc] init];
    [story3 setStoryText:@"Brett's Story Text"];
    [story3 setSubject:@"Wartburg Choir"];
    [story3 setDatePosted:@"1/28/14"];
    [story3 setAuthor:@"Brett"];
    [story3 setThumbnail:[UIImage imageNamed:@"brett_pic.jpg"]];
    
    Story *story4 = [[Story alloc] init];
    [story4 setStoryText:@"Chris' Story Text"];
    [story4 setSubject:@"The Mensa food was SO goodddddddddd"];
    [story4 setDatePosted:@"1/30/14"];
    [story4 setAuthor:@"Chris"];
    [story4 setThumbnail:[UIImage imageNamed:@"chris_pic.jpg"]];
    
    items = [[NSArray alloc] initWithObjects:story1, story2, story3, story4, nil];
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
//    return [[[StoryStore sharedStore] allItems] count];
    return [items count];
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
    
    Story *story = [items objectAtIndex:indexPath.row];
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
    
    Story *selectedStory = [items objectAtIndex:[indexPath row]];
    
    [storyDetailViewController setStory:selectedStory];
    
    [[self navigationController] pushViewController:storyDetailViewController animated:YES];
}



@end
