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
@synthesize nameField, subjectField, locationField, shouldShowProfilePicture, storyTextField, activeField;

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

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    [self registerForKeyboardNotifications];
    
    
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
    [[StoryStore sharedStore] removeStory:[self story]];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}


- (void)save:(id)sender
{
    
    story[@"subject"] = [subjectField text];
    story[@"text"] = [storyTextField text];
    story[@"author"] = [nameField text];
    story[@"location"] = [locationField text];
    
    // sets the Story iVar datePosted as today's date.
    NSDate *today = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    NSString *dateCreated = [formatter stringFromDate:today];
    story[@"datePosted"] = dateCreated;
    
    [story saveInBackground];
    
    // checks to see if the user wants to use their own picture as a display img
    if ([shouldShowProfilePicture isOn]) {
        //code to set facebook profile pic as thumbnail
    } else {
        //story[@"thumbnail"] = [UIImage imageNamed:@"brett_dog.jpg"];
    }

    
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}


#pragma mark - Other stuff

// removes the keyboard when the background is tapped.
- (IBAction)backgroundTapped:(id)sender
{
    [[self view] endEditing:YES];
}


// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;

    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    CGPoint origin = activeField.frame.origin;
    origin.y -= scrollView.contentOffset.y;
    if (!CGRectContainsPoint(aRect, origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y-(aRect.size.height));
        [scrollView setContentOffset:scrollPoint animated:YES];
    }

}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
}





@end
