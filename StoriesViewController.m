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



@implementation StoriesViewController
@synthesize tableView, items;


#pragma mark - Set-up stuff

- (void)viewDidLoad
{
    Story *story1 = [[Story alloc] init];
    [story1 setStoryText:@"I LOVED MAH KITTY SO MUCH EYE DIED"];
    [story1 setSubject:@"MAH KITTEH"];
    [story1 setDatePosted:@"1/28/14"];
    
    Story *story2 = [[Story alloc] init];
    [story2 setStoryText:@"I LOVED MAH BRETTIFER SOOOOOOO MUCH THAT THINGS HAPPENED"];
    [story2 setSubject:@"BRETTIFER"];
    [story2 setDatePosted:@"1/30/14"];
    items = [[NSArray alloc] initWithObjects:story1, story2, nil];
    
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
    
    return cell;
}



@end
