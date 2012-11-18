//
//  gameBackgroundLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer
-(id) init{
    if(self = [super init]){
    }
    return self;
}
-(void) menuScene{
    [self gameScene];
}
-(void) gameScene{
    CCSprite *sky = [CCSprite spriteWithFile:@"sky.png"];
    sky.anchorPoint = CGPointZero;
    [self addChild:sky];
    
}
-(void) dealloc{
    NSLog(@"BackgroundLayer release");
    [super dealloc];
}
@end
