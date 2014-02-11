//
//  HomeViewController.m
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "HomeViewController.h"
#import "StoriesViewController.h"
#import "StoryDetailViewController.h"
#import "LocationViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface HomeViewController () <FBLoginViewDelegate>

@end

@implementation HomeViewController

#pragma mark - Set Up

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSBundle *appBundle = [NSBundle mainBundle];
    self = [super initWithNibName:@"HomeViewController" bundle:appBundle];
    if (self) {
        
        // creates the login button and displays it
        FBLoginView *loginView = [[FBLoginView alloc] init];
        loginView.delegate = self;
        [self.view addSubview:loginView];
        
        // chooses where the login button is displayed
        loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), (self.view.center.y - 150));
        
        // disabling the storyMap/stories buttons
        [self.storyMap setEnabled:NO];
        [self.storiesButton setEnabled:NO];
        
        // Wartburg Orange - #FF6F30
        [self.view setBackgroundColor:[UIColor colorWithRed:1 green:0.435 blue:0.188 alpha:1.0]];
        
    }
    return self;
}

#pragma mark - Facebook methods

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    //allows you to get info about the user
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // Success! Include your code to handle the results here
      //      NSLog(@"user info: %@", result);
        } else {
            // An error occurred, we need to handle the error
            // See: https://developers.facebook.com/docs/ios/errors
        }
    }];
    
    self.userID = user.id;
    
    self.profilePicture.profileID = self.userID;
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    // changes the UI for a logged IN user
    [self.storyMap setEnabled:YES];
    [self.storiesButton setEnabled:YES];
    [self.instructionLabel setHidden:YES];
    

}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    // changes the UI for a logged OUT user
    [self.storyMap setEnabled:NO];
    //[self.storiesButton setEnabled:NO];
    [self.instructionLabel setHidden:NO];
    self.profilePicture.profileID = nil;
}

// Handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;
    
    // If the user should perform an action outside of you app to recover,
    // the SDK will provide a message for the user, you just need to surface it.
    // This conveniently handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures that happen outside of the app
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

#pragma mark - Buttons n stuff

- (void)watchVideo:(id)sender
{
//    NSURL *url = [[NSURL alloc] initWithString: @"https://www.youtube.com/watch?v=_fZ5Vo3WWQQ"];
//    [[UIApplication sharedApplication] openURL:url];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"worth_it" ofType:@"mp4"];
    player = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    
    
    
    [self presentMoviePlayerViewControllerAnimated:player];
    

}

- (IBAction)showStories:(id)sender
{
    StoriesViewController *svc = [[StoriesViewController alloc] init];
    [[self navigationController] pushViewController:svc animated:YES];
    
}

- (IBAction)showMap:(id)sender
{
    LocationViewController *lvc = [[LocationViewController alloc] init];
    [[self navigationController] pushViewController:lvc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
