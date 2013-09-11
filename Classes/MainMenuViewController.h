//
//  MainMenuViewController.h
//  15 puzzle
//
//  Created by Patrick Mc Gartoll on 11/28/10.
//  Copyright 2010 Drenguin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class _5_puzzleViewController;

@interface MainMenuViewController : UIViewController {
	IBOutlet _5_puzzleViewController *gameView;
}
-(IBAction)switchViews:(id)sender;


@end
