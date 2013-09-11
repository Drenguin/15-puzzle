//
//  _5_puzzleViewController.m
//  15 puzzle
//
//  Created by Patrick Mc Gartoll on 11/21/10.
//  Copyright Drenguin 2010. All rights reserved.
//

#import "_5_puzzleViewController.h"

@implementation _5_puzzleViewController
@synthesize b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,pauseBtn,bannerIsVisible;

-(PuzzleBrain *)brain
{
	if(!brain) {
		brain = [[PuzzleBrain alloc] init];
	}
	return brain;
}

-(IBAction)start
{ 
	time = 0;
	bob = 0;
	spaceLocX = 0;
	spaceLocY = 0;
	NSMutableArray *array = [[self brain] scramble];
	NSMutableArray *firstColumn = [[NSMutableArray arrayWithObjects:b1,b2,b3,b4,nil]retain];
	NSMutableArray *secondColumn = [[NSMutableArray arrayWithObjects:b5,b6,b7,b8,nil]retain];
	NSMutableArray *thirdColumn = [[NSMutableArray arrayWithObjects:b9,b10,b11,b12,nil]retain];
	NSMutableArray *fourthColumn = [[NSMutableArray arrayWithObjects:b13,b14,b15,b16,nil]retain];
	buttons = [[NSMutableArray arrayWithObjects:firstColumn,secondColumn,thirdColumn,fourthColumn,nil] retain];
	for(int i = 0; i < 4; i++) {
		for (int j = 0; j<4; j++) {
			[[[buttons objectAtIndex:i] objectAtIndex:j] setTitle:[array objectAtIndex:j+(i*4)] forState:UIControlStateNormal];
			if([[array objectAtIndex:j+(i*4)] isEqualToString:@" "])
			{
				spaceLocX = i;
				spaceLocY = j;
			}
		}
	}
	hasStartedGame = YES;
	playing = YES;
}

-(void)timeChanged:(NSTimer *)timer{
	if(playing && hasStartedGame) {
		time += 1;
		if((time%60)<=9) {
			label.text = [NSString stringWithFormat:@"%d:0%d",(time/60),(time%60)];
		} else {
			label.text = [NSString stringWithFormat:@"%d:%d",(time/60),(time%60)];
		}
	}
}

-(void)animateTimer
{
	trueTime+=0.05f;
	trueTime2+=0.05f;
	trueTime3+=0.05f;
	if(trueTime>5)
	{
		trueTime = 0;
		animatingCircleX = arc4random()%480;
		animatingCircleY = arc4random()%480;
	}
	if (trueTime2 > 5) {
		trueTime2 = 0;
		animatingCircle2X = arc4random()%480;
		animatingCircle2Y = arc4random()%480;
	}
	if (trueTime3 > 5) {
		trueTime3 = 0;
		animatingCircle3X = arc4random()%480;
		animatingCircle3Y = arc4random()%480;
	}

	if(playing) {
		animatingCircle.frame = CGRectMake(animatingCircleX-20-trueTime*20/2, animatingCircleY-trueTime*20/2,20+trueTime*20,20+trueTime*20);
		animatingCircle2.frame = CGRectMake(animatingCircle2X-20-trueTime2*20/2, animatingCircle2Y-trueTime2*20/2,20+trueTime2*20,20+trueTime2*20);
		animatingCircle3.frame = CGRectMake(animatingCircle3X-20-trueTime3*20/2, animatingCircle3Y-trueTime3*20/2,20+trueTime3*20,20+trueTime3*20);
	}
}

-(IBAction)clickedButton:(id)sender
{
	int senderLocX = 0;
	int senderLocY = 0;
	for(int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			if([[[[[buttons objectAtIndex:i] objectAtIndex:j] titleLabel]text] isEqualToString:[[sender titleLabel] text]])
			{
				senderLocX = i;
				senderLocY = j;
			}
		}
	}
	/*if((senderLocX-1 == spaceLocX && senderLocY == spaceLocY)|| (senderLocX+1 == spaceLocX && senderLocY == spaceLocY) || (senderLocY-1 == spaceLocY && senderLocX == spaceLocX) || (senderLocY+1 == spaceLocY && senderLocX == spaceLocX)) {
		[[[buttons objectAtIndex:spaceLocX]objectAtIndex:spaceLocY] setTitle:[NSString stringWithFormat:@"%@",[[sender titleLabel] text]] forState:UIControlStateNormal];	
		[sender setTitle:@" " forState:UIControlStateNormal];
		spaceLocX = senderLocX;
		spaceLocY = senderLocY;
		bob+=1;
	}*/
	if(senderLocX > spaceLocX && senderLocY == spaceLocY)
	{
		for(int i = spaceLocX; i < senderLocX; i++) {
			[[[buttons objectAtIndex:i] objectAtIndex:senderLocY] setTitle:[NSString stringWithFormat:@"%@",[[[[buttons objectAtIndex:i+1] objectAtIndex:senderLocY] titleLabel] text]] forState:UIControlStateNormal];
		}
		[sender setTitle:@" " forState:UIControlStateNormal];
		spaceLocX = senderLocX;
		bob+=1;
	}else if(senderLocX < spaceLocX && senderLocY == spaceLocY)
	{
		for(int i = spaceLocX; i > senderLocX; i--) {
			[[[buttons objectAtIndex:i] objectAtIndex:senderLocY] setTitle:[NSString stringWithFormat:@"%@",[[[[buttons objectAtIndex:i-1] objectAtIndex:senderLocY] titleLabel] text]] forState:UIControlStateNormal];
		}
		[sender setTitle:@" " forState:UIControlStateNormal];
		spaceLocX = senderLocX;
		bob+=1;
	}else if(senderLocY > spaceLocY && senderLocX == spaceLocX)
	{
		for(int i = spaceLocY; i < senderLocY; i++) {
			[[[buttons objectAtIndex:senderLocX] objectAtIndex:i] setTitle:[NSString stringWithFormat:@"%@",[[[[buttons objectAtIndex:senderLocX] objectAtIndex:i+1] titleLabel] text]] forState:UIControlStateNormal];
		}
		[sender setTitle:@" " forState:UIControlStateNormal];
		spaceLocY = senderLocY;
		bob+=1;
	}else if(senderLocY < spaceLocY && senderLocX == spaceLocX)
	{
		for(int i = spaceLocY; i > senderLocY; i--) {
			[[[buttons objectAtIndex:senderLocX] objectAtIndex:i] setTitle:[NSString stringWithFormat:@"%@",[[[[buttons objectAtIndex:senderLocX] objectAtIndex:i-1] titleLabel] text]] forState:UIControlStateNormal];
		}
		[sender setTitle:@" " forState:UIControlStateNormal];
		spaceLocY = senderLocY;
		bob+=1;
	}
	if([[self brain]didWin:buttons])
	{
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"YOU WON!"
							  message:[NSString stringWithFormat:@"It took you %d taps\nand %d seconds\nClick \"Start\" to play again",bob,time]
							  delegate:self
							  cancelButtonTitle:@"Okay"
							  otherButtonTitles:nil];
		[alert show];
		[alert release];
		playing = NO;
		hasStartedGame = NO;
	}
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}
- (void) viewDidLoad {
	myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChanged:) userInfo:nil repeats:YES];
	myRealTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(animateTimer) userInfo:nil repeats:YES];
	playing = NO;
	hasStartedGame = NO;
	adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
	adView.frame = CGRectOffset(adView.frame, 0, -50);
	adView.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait,ADBannerContentSizeIdentifierLandscape,nil];
	adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
	[self.view addSubview:adView];
	adView.delegate=self;
	self.bannerIsVisible=NO;
	trueTime = 0;
	trueTime2 = 1;
	trueTime3 = 2;
	animatingCircleX = arc4random()%480;
	animatingCircleY = arc4random()%480;
	animatingCircle2X = arc4random()%480;
	animatingCircle2Y = arc4random()%480;
	animatingCircle3X = arc4random()%480;
	animatingCircle3Y = arc4random()%480;
	[super viewDidLoad];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
	if (!self.bannerIsVisible)
	{
		// banner is invisible now and moved out of the screen on 50 px
		banner.frame = CGRectMake(0,0,banner.frame.size.height,banner.frame.size.width);
		self.bannerIsVisible = YES;
	}
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
	if (self.bannerIsVisible)
	{
		// banner is visible and we move it out of the screen, due to connection issue
		banner.frame = CGRectMake(0,-100,banner.frame.size.height,banner.frame.size.width);
		self.bannerIsVisible = NO;
	}
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
	NSLog(@"Banner view is beginning an ad action");
	BOOL shouldExecuteAction = YES;
	if (!willLeave && shouldExecuteAction)
    {
		playing = NO;
    }
	return shouldExecuteAction;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
	playing = YES;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	if(toInterfaceOrientation == UIInterfaceOrientationPortrait)
	{
		adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
		adView.frame = CGRectMake(0, 0, 320, 50);
		pauseBtn.frame = CGRectMake(28, 398, 90, 45);
		b1.frame = CGRectMake(28, 102, 60, 60);
		b2.frame = CGRectMake(96, 102, 60, 60);
		b3.frame = CGRectMake(164, 102, 60, 60);
		b4.frame = CGRectMake(232, 102, 60, 60);
		b5.frame = CGRectMake(28, 170, 60, 60);
		b6.frame = CGRectMake(96, 170, 60, 60);
		b7.frame = CGRectMake(164, 170, 60, 60);
		b8.frame = CGRectMake(232, 170, 60, 60);
		b9.frame = CGRectMake(28, 238, 60, 60);
		b10.frame = CGRectMake(96, 238, 60, 60);
		b11.frame = CGRectMake(164, 238, 60, 60);
		b12.frame = CGRectMake(232, 238, 60, 60);
		b13.frame = CGRectMake(28, 306, 60, 60);
		b14.frame = CGRectMake(96, 306, 60, 60);
		b15.frame = CGRectMake(164, 306, 60, 60);
		b16.frame = CGRectMake(232, 306, 60, 60);
	} else {
		adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
		adView.frame = CGRectMake(0, 0, 480, 32);
		pauseBtn.frame = CGRectMake(362, 198, 90, 45);
		b1.frame = CGRectMake(28, 40, 60, 60);
		b2.frame = CGRectMake(96, 40, 60, 60);
		b3.frame = CGRectMake(164, 40, 60, 60);
		b4.frame = CGRectMake(232, 40, 60, 60);
		b5.frame = CGRectMake(28, 108, 60, 60);
		b6.frame = CGRectMake(96, 108, 60, 60);
		b7.frame = CGRectMake(164, 108, 60, 60);
		b8.frame = CGRectMake(232, 108, 60, 60);
		b9.frame = CGRectMake(28, 176, 60, 60);
		b10.frame = CGRectMake(96, 176, 60, 60);
		b11.frame = CGRectMake(164, 176, 60, 60);
		b12.frame = CGRectMake(232, 176, 60, 60);
		b13.frame = CGRectMake(28, 244, 60, 60);
		b14.frame = CGRectMake(96, 244, 60, 60);
		b15.frame = CGRectMake(164, 244, 60, 60);
		b16.frame = CGRectMake(232, 244, 60, 60);
	}

}

-(IBAction)pause
{
	playing = NO;
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

-(void)resumePlaying
{
	playing = YES;
}

- (void)dealloc {
	[b1 release];
	[b2 release];
	[b3 release];
	[b4 release];
	[b5 release];
	[b6 release];
	[b7 release];
	[b8 release];
	[b9 release];
	[b10 release];
	[b11 release];
	[b12 release];
	[b13 release];
	[b14 release];
	[b15 release];
	[b16 release];
	[buttons release];
	adView.delegate = nil;
	[adView release];
    [super dealloc];
}

@end
