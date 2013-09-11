//
//  PuzzleBrain.m
//  15 puzzle
//
//  Created by Patrick Mc Gartoll on 11/21/10.
//  Copyright 2010 Drenguin. All rights reserved.
//

#import "PuzzleBrain.h"


@implementation PuzzleBrain

-(NSMutableArray *) scramble
{
	pieces = [[[NSMutableArray alloc] init] retain];
	NSMutableArray *nums = [NSMutableArray arrayWithObjects: @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@" ",nil];
	for (int i = 0; i < 16; i++) {			
		int r = arc4random() % [nums count];
		[pieces addObject:[NSString stringWithFormat: @"%@",[nums objectAtIndex:r]]];
		[nums removeObjectAtIndex:r];
	}
	return pieces;
}

-(BOOL)didWin:(NSMutableArray *) b
{
	for(int i = 0; i < 4; i++) {
		for(int j = 0; j < 4; j++) {
			[pieces replaceObjectAtIndex:j+(i*4) withObject:[NSString stringWithFormat:@"%@",[[[[b objectAtIndex:i] objectAtIndex:j] titleLabel] text]]];
		}
	}
	NSMutableArray *nums = [NSMutableArray arrayWithObjects: @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@" ",nil];
	if([nums isEqualToArray:pieces])
	{
		return YES;
	}
	return NO;
}

@end
