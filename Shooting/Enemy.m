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
    bulletArray = [[NSMutableArray alloc]init];
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
        [self performSelector:@selector(appearAnimation) withObject:nil afterDelay:0.05];
    }
}
-(void) moveAnimation{
    if(plus == NO)
        [self setDisplayFrame:moveFrame[presentMoveFrame++]];
    else
        [self setDisplayFrame:moveFrame[--presentMoveFrame]];
    if(presentMoveFrame > moveFrameCount || presentMoveFrame == 0)
        plus = !plus;
    [self performSelector:@selector(moveAnimation) withObject:nil afterDelay:0.1];
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
    CGPoint userPosition = [UserInfo sharedUserInfo].userPosition;
    float distance = (pow(pow(userPosition.x - self.position.x,2)+pow(userPosition.y - self.position.y, 2), 0.5));
    float delay = distance/speed;
    [self stopAllActions];
    [self runAction:[CCMoveTo actionWithDuration:delay position:userPosition]];
    [self performSelector:@selector(moveUser) withObject:nil afterDelay:0.5];
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
    if([bulletArray containsObject:[NSNumber numberWithInt:bullet.bulletID]]){
        return 0;
    }else{
        [bullet setHitting];
        [bulletArray addObject:[NSNumber numberWithInt:bullet.bulletID]];
        hp -= bullet.bulletPower;
        if(hp<= 0 && die == NO){
            die = YES;
            return 1;
        }
        [self performSelector:@selector(removeID:) withObject:[NSNumber numberWithInt:bullet.bulletID] afterDelay:1];
    }
    return 0;
}
-(void) removeID:(id)bulletID{
    [bulletArray removeObject:bulletID];
}
-(void) dealloc{
    NSLog(@"Enemy release");
    [self removeMoveFrame];
    [bulletArray release];
    [super dealloc];
}
@end
