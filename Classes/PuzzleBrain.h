//
//  PuzzleBrain.h
//  15 puzzle
//
//  Created by Patrick Mc Gartoll on 11/21/10.
//  Copyright 2010 Drenguin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PuzzleBrain : NSObject {
	NSMutableArray *pieces;
}

-(NSMutableArray *)scramble;
-(BOOL)didWin:(NSMutableArray *)b;

@end
