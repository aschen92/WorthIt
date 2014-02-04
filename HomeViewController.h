//
//  HomeViewController.h
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <FacebookSDK/FacebookSDK.h>


@interface HomeViewController : UIViewController <UINavigationControllerDelegate>
{
    MPMoviePlayerViewController *player;
}

@property(retain) IBOutlet UIButton *storyMap;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;

@property(nonatomic) NSString *uID;

- (IBAction)watchVideo:(id)sender;
- (IBAction)showStories:(id)sender;
- (IBAction)showMap:(id)sender;

@end
