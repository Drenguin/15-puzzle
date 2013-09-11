//
//  _5_puzzleAppDelegate.h
//  15 puzzle
//
//  Created by Patrick Mc Gartoll on 11/21/10.
//  Copyright Drenguin 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;

@interface _5_puzzleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainMenuViewController *viewController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainMenuViewController *viewController;

@end

