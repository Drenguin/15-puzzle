//
//  _5_puzzleViewController.h
//  15 puzzle
//
//  Created by Patrick Mc Gartoll on 11/21/10.
//  Copyright Drenguin 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "PuzzleBrain.h"

@interface _5_puzzleViewController : UIViewController <ADBannerViewDelegate>
{
	PuzzleBrain *brain;
	ADBannerView *adView;
	BOOL bannerIsVisible;
	IBOutlet UIButton *b1;
	IBOutlet UIButton *b2;
	IBOutlet UIButton *b3;
	IBOutlet UIButton *b4;
	IBOutlet UIButton *b5;
	IBOutlet UIButton *b6;
	IBOutlet UIButton *b7;
	IBOutlet UIButton *b8;
	IBOutlet UIButton *b9;
	IBOutlet UIButton *b10;
	IBOutlet UIButton *b11;
	IBOutlet UIButton *b12;
	IBOutlet UIButton *b13;
	IBOutlet UIButton *b14;
	IBOutlet UIButton *b15;
	IBOutlet UIButton *b16;
	IBOutlet UIButton *pauseBtn;
	IBOutlet UILabel *label;
	IBOutlet UIImageView *animatingCircle;
	IBOutlet UIImageView *animatingCircle2;
	IBOutlet UIImageView *animatingCircle3;
	NSMutableArray *buttons;
	NSTimer *myTimer;
	NSTimer *myRealTimer;
	int spaceLocX;
	int spaceLocY;
	int bob;
	int time;
	int animatingCircleX;
	int animatingCircleY;
	int animatingCircle2X;
	int animatingCircle2Y;
	int animatingCircle3X;
	int animatingCircle3Y;
	float trueTime,trueTime2,trueTime3;
	BOOL playing;
	BOOL hasStartedGame;
}
@property (nonatomic,assign) BOOL bannerIsVisible;
@property (nonatomic, retain) IBOutlet UIButton *b1;
@property (nonatomic, retain) IBOutlet UIButton *b2;
@property (nonatomic, retain) IBOutlet UIButton *b3;
@property (nonatomic, retain) IBOutlet UIButton *b4;
@property (nonatomic, retain) IBOutlet UIButton *b5;
@property (nonatomic, retain) IBOutlet UIButton *b6;
@property (nonatomic, retain) IBOutlet UIButton *b7;
@property (nonatomic, retain) IBOutlet UIButton *b8;
@property (nonatomic, retain) IBOutlet UIButton *b9;
@property (nonatomic, retain) IBOutlet UIButton *b10;
@property (nonatomic, retain) IBOutlet UIButton *b11;
@property (nonatomic, retain) IBOutlet UIButton *b12;
@property (nonatomic, retain) IBOutlet UIButton *b13;
@property (nonatomic, retain) IBOutlet UIButton *b14;
@property (nonatomic, retain) IBOutlet UIButton *b15;
@property (nonatomic, retain) IBOutlet UIButton *b16;
@property (nonatomic, retain) IBOutlet UIButton *pauseBtn;

-(IBAction)clickedButton:(id)sender;
-(IBAction)start;
-(IBAction)pause;
-(void)resumePlaying;

@end

