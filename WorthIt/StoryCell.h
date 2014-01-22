//
//  StoryCell.h
//  WorthIt
//
//  Created by Aaron Schendel on 1/22/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryCell : UITableViewCell

@property (weak, nonatomic) id controller;
@property (weak, nonatomic) UITableView *tableView;

@end
