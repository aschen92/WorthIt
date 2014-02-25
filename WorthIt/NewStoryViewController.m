//
//  NewStoryViewController.m
//  WorthIt
//
//  Created by Aaron Schendel on 2/4/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "NewStoryViewController.h"
#import "StoryStore.h"

@interface NewStoryViewController ()

@end

@implementation NewStoryViewController
@synthesize story, scrollView;
@synthesize dismissBlock;
@synthesize nameField, subjectField, locationField, shouldShowProfilePicture, storyTextField;

#pragma mark - Initialization Stuff

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
        UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
        
        [[self navigationItem] setLeftBarButtonItem:cancelItem];
        [[self navigationItem] setRightBarButtonItem:saveItem];
        
        // Wartburg Orange - #FF6F30
        [self.view setBackgroundColor:[UIColor colorWithRed:1 green:0.435 blue:0.188 alpha:1.0]];
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    // recognizes when background is tapped and calls dismissKeyboard
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
}



- (void)dismissKeyboard
{
    [self.nameField resignFirstResponder];
    [self.subjectField resignFirstResponder];
    [self.locationField resignFirstResponder];
    [self.storyTextField resignFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[self view] endEditing:YES];
    
    
}

#pragma mark - Button methods

- (void)cancel:(id)sender
{
    // TODO: fix this feature
    [[StoryStore sharedStore] removeStory:[self story]];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}


- (void)save:(id)sender
{
    
    [story setSubject:[subjectField text]];
    [story setStoryText:[storyTextField text]];
    [story setAuthor:[nameField text]];
    
    // sets the Story iVar datePosted as today's date.
    NSDate *today = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    NSString *dateCreated = [formatter stringFromDate:today];
    [story setDatePosted:dateCreated];
    
    
    // checks to see if the user wants to use their own picture as a display img
    if ([shouldShowProfilePicture isOn]) {
        //code to set facebook profile pic as thumbnail
    } else {
        [story setThumbnail:[UIImage imageNamed:@"brett_dog.jpg"]];
    }

    [story updateDict];
    [[StoryStore sharedStore] saveChanges];
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}


#pragma mark - Other stuff

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointZero animated:YES];
}

// removes the keyboard when the background is tapped.
- (IBAction)backgroundTapped:(id)sender
{
    [[self view] endEditing:YES];
}
@end
