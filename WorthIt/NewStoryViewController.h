//
//  NewStoryViewController.h
//  WorthIt
//
//  Created by Aaron Schendel on 2/4/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Story.h"
#import <Parse/Parse.h>

@interface NewStoryViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *subjectField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UISwitch *shouldShowProfilePicture;
@property (weak, nonatomic) IBOutlet UITextView *storyTextField;



@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@property (nonatomic, copy) void (^dismissBlock)(void);
@property (nonatomic, weak) PFObject *story;

- (void)dismissKeyboard;

@end
