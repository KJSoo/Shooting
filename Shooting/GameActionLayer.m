//
//  GameActionLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "GameActionLayer.h"
#define BEGIN 1
#define MOVED 2
#define ENDED 3

@implementation GameActionLayer
-(id) init{
    if( self = [super init]){
        self.isTouchEnabled = YES;
        character = [[Character alloc]init];
        [self addChild:character];
    }
    return self;
}
-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{  
    UITouch*touch=[touches anyObject];
    CGPoint location=[touch locationInView:[touch view]];
    location=[[CCDirector sharedDirector] convertToGL:location];
    [character setPositions:location mode:BEGIN];
}
-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch*touch=[touches anyObject];
    CGPoint location=[touch locationInView:[touch view]];
    location=[[CCDirector sharedDirector] convertToGL:location];
    [character setPositions:location mode:MOVED];
}
-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [character setPositions:CGPointZero mode:ENDED];
}
-(void) dealloc{
    [character release];
    [super dealloc];
}
@end
