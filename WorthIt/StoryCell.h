//
//  StoryCell.h
//  WorthIt
//
//  Created by Aaron Schendel on 1/22/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *storySubject;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;



@property (weak, nonatomic) id controller;
@property (weak, nonatomic) UITableView *tableView;

@end
