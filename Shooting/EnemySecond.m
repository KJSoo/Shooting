//
//  EnemySecond.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 5..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "EnemySecond.h"


@implementation EnemySecond
-(id) initWithBatchNode:(CCSpriteBatchNode*)batchNode{
    circle = 80 + arc4random()%70;
    enemyID = arc4random();
    
    self = [super initWithTexture:batchNode.texture rect:CGRectMake(0, 90, 37, 35)];
    hp = 50;
    power = 20;
    exp = 3;
    money = 20;
    speed = 3;// 1초당 움직일 각도
    score = 200; // 점수
    for(int i=0 ; i < 9 ; i++){
        appearFrame[i] = [[CCSpriteFrame alloc] initWithTexture:batchNode.texture rect:CGRectMake(37 * i, 90, 37, 35)];
        appearFrameCount = i;
    }
    for(int i=0 ; i < 8 ; i++){
        moveFrame[i] = [[CCSpriteFrame alloc] initWithTexture:batchNode.texture rect:CGRectMake(185 + 37 * i, 90, 37, 35)];
        moveFrameCount = i;
    }
    
    [self settingPosition];
    return self;
}
-(void) moveUser{
    CGPoint userPosition = [UserInfo sharedUserInfo].userPosition;
    
    endAngle = (int)[self getAngle:self.position :userPosition];
    
    centerPosition = [self anglePoint:endAngle :circle/2 :self.position];
    
    startAngle = [self getAngle:centerPosition :self.position];
    endAngle = 180;
    if([self getDistance:self.position :userPosition] > circle){
        phase = !phase;
        turn = NO;
    }
    else if(turn == NO){
        phase =! phase;
        turn = YES;
    }
    [self rotateEnemy];
}
-(void) rotateEnemy{
    if(phase)
        startAngle += speed;
    else
        startAngle -= speed;
    endAngle -= 3;
    startAngle = (int)startAngle % 360;
    if(startAngle < 0)
        startAngle += 360;
    
    //self.position = [self anglePoint:startAngle :circle/2 :centerPosition];
    if(endAngle < 0){
        [self moveUser];
    }else{
        [self runAction:[CCSequence actions:[CCMoveTo actionWithDuration:0.01 position:[self anglePoint:startAngle :circle/2 :centerPosition]],[CCCallFunc actionWithTarget:self selector:@selector(rotateEnemy)], nil]];
        //[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.01],[CCCallFunc actionWithTarget:self selector:@selector(rotateEnemy)], nil]];
    }
}
-(CGPoint) anglePoint:(float)angle:(float)dis:(CGPoint)mainPosition{
    float radian = angle / 180 * M_PI;
    float distance = dis;
    
    return CGPointMake(mainPosition.x + (distance * cos(radian)), mainPosition.y + (distance * sin(radian)));
}
-(float) getDistance:(CGPoint)mainPosition:(CGPoint)targetPosition{
    return pow(pow(targetPosition.x - mainPosition.x, 2)+pow(targetPosition.y - mainPosition.y, 2), 0.5);
}
-(float) getAngle:(CGPoint)mainPosition:(CGPoint)targetPostion{
    targetPostion = ccp(targetPostion.x - mainPosition.x, targetPostion.y - mainPosition.y); // 원점을 기준으로 하기 위해
    float radian;
    if( targetPostion.y == 0) {            // x축 평행선에 위치
        if ( targetPostion.x >= 0)                // 동일점이거나 오른쪽 위치 : 0도
            radian = 0;
        else                       // 왼쪽에 위치 : 180도
            radian = M_PI;
    }
    
    if( targetPostion.x == 0 ) {            // y축 평행선에 위치
        if( targetPostion.y > 0 )                // 위쪽에 위치 : 90도
            radian = M_PI_2;
        else                         // 아래쪽에 위치: 270도
            radian = M_PI_2+M_PI;
    }
    else if( targetPostion.x >0 )             // 기준점 오른쪽
    {
        if(targetPostion.y >0)                        // 기준점 위쪽 : 1사분면
            radian = atan(targetPostion.y/targetPostion.x);     
        else                           // 기준점 아래 : 4사분면
            radian = atan(targetPostion.y/targetPostion.x) + 2*M_PI;
    }else                              // 기준점 왼쪽 : 2,3사분면
        radian = atan(targetPostion.y/targetPostion.x) + M_PI;
    return radian * 180 / M_PI;
}

@end
