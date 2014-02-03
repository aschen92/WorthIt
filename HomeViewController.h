//
//  HomeViewController.h
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface HomeViewController : UIViewController
{
    MPMoviePlayerViewController *player;
}

- (IBAction)watchVideo:(id)sender;
- (IBAction)showStories:(id)sender;
- (IBAction)showMap:(id)sender;

@end
