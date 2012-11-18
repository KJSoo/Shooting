//
//  EnemyFirst.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 5..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "EnemyFirst.h"


@implementation EnemyFirst
-(id) initWithBatchNode:(CCSpriteBatchNode*)batchNode{
    enemyID = arc4random();

    self = [super initWithTexture:batchNode.texture rect:CGRectMake(0, 0, 30, 30)];
    hp = 20;
    power = 10;
    exp = 1;
    money = 10;
    speed = 120;// 1초당 움직일 픽셀수
    score = 100; // 점수 
    for(int i=0 ; i < 9 ; i++){
        appearFrame[i] = [[CCSpriteFrame alloc] initWithTexture:batchNode.texture rect:CGRectMake(30 * i, 0, 30, 30)];
        appearFrameCount = i;
    }
    for(int i=0 ; i < 9 ; i++){
        moveFrame[i] = [[CCSpriteFrame alloc] initWithTexture:batchNode.texture rect:CGRectMake(30 * i, 31, 30, 30)];
        moveFrameCount = i;
    }

    [self settingPosition];
    return self;
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
    
}
@end
