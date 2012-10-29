//
//  Enemy.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 28..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"


@implementation Enemy
@synthesize appear;
@synthesize hp,power,exp,enemyID;
-(id) initWithBatchNode:(CCSpriteBatchNode*)batchNode level:(int)enemyLevel{
    level = enemyLevel;
    enemyID = arc4random();
    if (level == 1){
        self = [super initWithTexture:batchNode.texture rect:CGRectMake(0, 0, 30, 30)];
        hp = 100;
        power = 10;
        exp = 1;
        speed = 120;// 1초당 움직일 픽셀수
        for(int i=0 ; i < 9 ; i++){
            appearFrame[i] = [[CCSpriteFrame alloc] initWithTexture:batchNode.texture rect:CGRectMake(30 * i, 0, 30, 30)];
            appearFrameCount = i;
        }
        for(int i=0 ; i < 9 ; i++){
            moveFrame[i] = [[CCSpriteFrame alloc] initWithTexture:batchNode.texture rect:CGRectMake(30 * i, 31, 30, 30)];
            moveFrameCount = i;
        }
    }else if(level == 2){
    
    }
    if(arc4random()%2){
        self.position = ccp(arc4random()%100,arc4random()%480);
    }else {
        self.position = ccp(220+arc4random()%100,arc4random()%480);
    }
    [self appearAnimation];
    return self;
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
    //[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveAnimation) userInfo:nil repeats:NO];        
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
    if(level == 1)
        [self moveUser];
}
-(void) moveUser{
    if(moveAction){
        [self stopAction:moveAction];
    }
    CGPoint userPosition = [UserInfo sharedUserInfo].userPosition;
    float distance = (pow(pow(userPosition.x - self.position.x,2)+pow(userPosition.y - self.position.y, 2), 0.5));
    float delay = distance/speed;
    moveAction = [CCSequence actions:[CCMoveTo actionWithDuration:delay position:userPosition],[CCDelayTime actionWithDuration:100], nil];
    // stopAction 에서 액션이 끝나버리면 오류가 발생 -> 액션의 딜레이를 100초 추가하여 끝나지 않게함
    [self runAction:moveAction];
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFunc actionWithTarget:self selector:@selector(moveUser)], nil]];

}/*
-(int) hitting:(MyBullet*)bullet{
    if(bullet.isHtiing){
        return 0;
    }else{
        [bullet setHitting];
        hp-= bullet.bulletPower;
        if( hp <= 0 && !die){
            die = YES;
            return 1;
        }
    }
    return 0;
}*/
-(int) hitting:(MyBullet*)bullet{
    [bullet setHitting];
    hp -= bullet.bulletPower;
    if(hp<= 0 && die == NO){
        die = YES;
        return 1;
    }
    return 0;
}

-(void) dealloc{
    NSLog(@"Enemy release");
    [self removeMoveFrame];
    [super dealloc];
}
@end
