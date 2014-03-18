//
//  StoriesViewController.h
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoriesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    __weak NSMutableArray *storiesss;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) UIBarButtonItem *bbi;
@property (nonatomic) NSInteger numOfStories;


- (IBAction)addNewItem:(id)sender;
- (void)refreshInvoked:(id)sender forState:(UIControlState)state;



@end