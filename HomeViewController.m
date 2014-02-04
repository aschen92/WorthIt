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
        FBLoginView *loginView = [[FBLoginView alloc] init];
        loginView.delegate = self;
        [self.view addSubview:loginView];
        [self.storyMap setEnabled:NO];
    }
    return self;
}

#pragma mark - Facebook methods

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    //allows you to get info about the user
    NSInteger uID = user.id;
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    // changes the UI for a logged in user
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    // changes the UI for a logged out user
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
