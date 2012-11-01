//
//  gameMenuLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "GameMenuLayer.h"


@implementation GameMenuLayer
-(id) init{
    if( self = [super init]){
        info = [UserInfo sharedUserInfo];
        piece = 160;
        float width = 320/(int)piece;
        hpBatch = [[CCSpriteBatchNode alloc]initWithFile:@"hpBar.png" capacity:(int)piece];
        [self addChild:hpBatch];
        
        for(int i = 0 ; i < (int)piece ; i++){
            CCSprite* gauge = [CCSprite spriteWithTexture:hpBatch.texture rect:CGRectMake(width*i, 0, width, 30)];
            gauge.anchorPoint = CGPointZero;
            gauge.position = ccp(width * i,0);
            [hpBatch addChild:gauge z:0 tag:i];
        }
        [self schedule:@selector(hpChange) interval:0.05];
    }
    return self;
}
-(void) hpChange{
    float persent = (piece / 100.0) *((float)info.hp/(float)info.originalHP)*100;
    int count = (int)persent;
    for(CCSprite *gauge in [hpBatch children]){
        //NSLog(@"tag  %d   count %d",gauge.tag,count);
        if(gauge.tag < count){
            if(gauge.opacity + 15 < 255)
                gauge.opacity += 15;
        }
        else {
            if(gauge.opacity - 15 > 70)
                gauge.opacity -= 15;
        }
    }
}
-(void) dealloc{
    NSLog(@"GameMenuLayer release");
    [hpBatch removeAllChildrenWithCleanup:YES];
    [hpBatch release];
    [super dealloc];
}
@end
