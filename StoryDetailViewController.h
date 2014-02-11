//
//  StoryDetailViewController.h
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Story;

@interface StoryDetailViewController : UIViewController <UINavigationControllerDelegate, UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UILabel *subjectField;
@property (weak, nonatomic) IBOutlet UITextView *storyTextField;


@property (nonatomic, strong) Story *story;
@property (nonatomic, copy) void (^dismissBlock)(void);


@end
