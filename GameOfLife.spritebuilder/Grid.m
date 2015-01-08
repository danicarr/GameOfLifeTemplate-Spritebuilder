//
//  Grid.m
//  GameOfLife
//
//  Created by danicarr on 1/8/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

//because we imported Grid.h we can use the variables _totalAlive and _generation in this class
#import "Grid.h"
#import "Creature.h"

//these are static variables that cant be changed
static const int GRID_ROWS = 8;
static const int GRID_COLUMNS = 10;

@implementation Grid{
    //these are private variables that cant be used out of this class
    NSMutableArray *_gridArray;
    float _cellWidth;
    float _cellHeight;
}

-(void) onEnter{
    [super onEnter];
    [self setupGrid];
    
    //accept touched on the grid
    self.userInteractionEnabled = YES;
}

-(void) setupGrid{
    //divide the grids size by the numer of columns/rows to figure out the width and height of each cell
    _cellWidth = self.contentSize.width / GRID_COLUMNS;
    _cellHeight = self.contentSize.height / GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    //initialize the array as a blank NSMutableArray (you can change the elements in it)
    _gridArray= [NSMutableArray array];
    
    //initialize Creatures
    for(int i = 0; i<GRID_ROWS; i++){
        //this is how you create 2D arrays in Objective-C. You put arrays into arrays.
        _gridArray[i] = [NSMutableArray array];
        x=0;
        
        for(int j=0; j<GRID_COLUMNS; j++){
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x,y);
            //to the grid (self) youre callling the method addChild and then what youre adding is the creature
            [self addChild: creature];
            
            //this is shorthand to access an array inside an array
            _gridArray[i][j]= creature;
            
            //make creatures visible to test this method, remove this once we know we have filled the grid properly
            creature.isAlive = YES;
            
            x+=_cellWidth;
        }
        
        y+=_cellHeight;
    }
}
    


@end
