//
//  Money.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 30..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "Gold.h"


@implementation Gold
@synthesize gold;
@synthesize timer;
-(id) init:(Enemy*)enemy{
    gold = enemy.money;
    if(gold < 100)
        self = [super initWithFile:@"gold1.png"];
    self.position = enemy.position;
    [self moveGold];
    [self schedule:@selector(timeOver) interval:5];
    return self;
}
-(void) timeOver{
    timer = YES;
}
-(void) moveGold{
    moveRandomPosition = [CCSequence actions:[CCMoveTo actionWithDuration:20 position:CGPointMake(arc4random()%320, arc4random()%480)],[CCDelayTime actionWithDuration:100000] ,nil];
    [self runAction:moveRandomPosition];
}
-(void) moveToUser:(Character*)user{
    if(pow(pow([user getSide].position.x - self.position.x, 2)+pow([user getSide].position.y - self.position.y, 2), 0.5) < user.magnetism){
        if(!stop)
            [self stopAction:moveRandomPosition];
        stop = YES;
        if(![self numberOfRunningActions])
            [self runAction:[CCMoveTo actionWithDuration:0.2 position:[user getSide].position]];
    }
}
-(void)dealloc{
    //NSLog(@"gold release");
    [super dealloc];
}
@end
