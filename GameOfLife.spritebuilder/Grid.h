//
//  Grid.h
//  GameOfLife
//
//  Created by danicarr on 1/8/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Grid : CCSprite

@property (nonatomic, assign) int totalAlive;
@property (nonatomic, assign) int generation;

-(void) evolveStep;
-(void) countNeighbors;
-(void) updateCreatures;
-(BOOL)isIndexValidForX:(int)x andY:(int)y;


@end
