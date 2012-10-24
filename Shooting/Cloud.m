//
//  Cloud.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "Cloud.h"
#define MAXCLOUD 3

@implementation Cloud
-(id) init{
    if(self = [super init]){
        for(int i = 0 ; i < MAXCLOUD ; i++)
            [self createCloud:i];
    }
    return self;
}
-(void) createCloud:(int)i{
    cloud[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"cloud%d.png",i+1]];
    cloud[i].anchorPoint = CGPointZero;
    cloud[i].position = ccp(320, 160 + (arc4random()%320-cloud[i].contentSize.height));
    cloud[i].tag = i;
    [cloud[i] runAction:[CCSequence actions:[CCMoveBy actionWithDuration:5+arc4random()%10 position:ccp(-320-cloud[i].contentSize.width,0)],[CCDelayTime actionWithDuration:2],[CCCallFuncN actionWithTarget:self selector:@selector(removeCloud:)] , nil]];
    [self addChild:cloud[i]];
}
-(void) removeCloud:(id)sender{
    CCSprite *receive = sender;
    int i = receive.tag;
    [self removeChild:cloud[i] cleanup:YES];
    [self createCloud:i];
}
@end
