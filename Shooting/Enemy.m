//
//  Enemy.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 28..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"


@implementation Enemy
@synthesize appear,isDie;
@synthesize hp,power,exp,enemyID,money,score;
-(id) initWithBatchNode:(CCSpriteBatchNode*)batchNode{
    return self;
}
-(void) settingPosition{
    int position = arc4random()%4;
    if(position == 0){
        self.position = ccp(arc4random()%100,arc4random()%480);
    }else if(position == 1){
        self.position = ccp(220+arc4random()%100,arc4random()%480);
    }else if(position == 2){
        self.position = ccp(arc4random()%320,arc4random()%100);
    }else {
        self.position = ccp(arc4random()%320,320 + (arc4random()%100));
    }
    [self appearAnimation];
}
-(void) appearAnimation{
    [self setDisplayFrame:appearFrame[presentAppearFrame++]];
    if(presentAppearFrame > appearFrameCount){
        appear = YES;
        [self moveAnimation];
        [self removeAppearFrame];
        [self movePattern];
    }else{
        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(appearAnimation) userInfo:nil repeats:NO];        
    }
}
-(void) moveAnimation{
    if(plus == NO)
        [self setDisplayFrame:moveFrame[presentMoveFrame++]];
    else
        [self setDisplayFrame:moveFrame[--presentMoveFrame]];
    if(presentMoveFrame > moveFrameCount || presentMoveFrame == 0)
        plus = !plus;
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.1],[CCCallFunc actionWithTarget:self selector:@selector(moveAnimation)], nil]];
}
-(void) removeAppearFrame{
    for(int i = 0 ; i <= appearFrameCount ; i++){
        [appearFrame[i] release];
    }
}
-(void) removeMoveFrame{
    for(int i = 0 ; i <= moveFrameCount ; i++){
        [moveFrame[i] release];
    }
}
-(void) movePattern{
    [self moveUser];
}
-(void) moveUser{}
-(int) hitting:(MyBullet*)bullet{
    bullet.isHtiing = YES;
    hp -= bullet.bulletPower;
    if(hp<= 0 && isDie == NO){
        isDie = YES;
        return 1;
    }
    return 0;
}

-(void) dealloc{
    //NSLog(@"enemy release");
    [self removeMoveFrame];
    [super dealloc];
}
@end
