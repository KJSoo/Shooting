//
//  MyAttack.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MyAttack.h"
#define BULLET 100
#define BULLETTYPE2 -2
@implementation MyAttack
-(id) init{
    if(self = [super init]){
    }
    return self;
}
-(void) attack:(CGPoint)userPosition:(CGPoint)targetPosition{
    setUserPosition = userPosition; setTargetPosition = targetPosition;
    int bulletType = [UserInfo sharedUserInfo].myBullet;
    [self createBullet:bulletType:setTargetPosition]; 
}
-(void) createBullet:(int)bulletType:(CGPoint)targetPosition{
    if(bulletType == 1){
        MyBullet *bullet = [[MyBullet alloc]init:setUserPosition:targetPosition:1:0];
        [bullet runAction:[CCSequence actions:[CCMoveTo actionWithDuration:bullet.bulletSpeed position:bullet.destinationPosition],[CCCallFuncN actionWithTarget:self selector:@selector(removeBullet:)],nil]];
        [self addChild:bullet z:1 tag:BULLET];
    }else if(bulletType == 2){
        [self createBullet:1:[self anglePoint:[self getAngle:setUserPosition :setTargetPosition]+10 :setUserPosition :targetPosition]];
        [self createBullet:1:[self anglePoint:[self getAngle:setUserPosition :setTargetPosition]-10 :setUserPosition :targetPosition]];
    }else if(bulletType == 3){
        [self createBullet:1:targetPosition];
        [self createBullet:2:targetPosition];
    }else if(bulletType == 4){
        [self createBullet:3 :targetPosition];
        [self createBullet:BULLETTYPE2 : targetPosition];
    }else if(bulletType == BULLETTYPE2){
        MyBullet *bullet = [[MyBullet alloc]init:setUserPosition:targetPosition:2:(int)[self getAngle:setUserPosition :setTargetPosition]];
        [bullet runAction:[CCSequence actions:[CCMoveTo actionWithDuration:bullet.bulletSpeed position:bullet.destinationPosition],[CCCallFuncN actionWithTarget:self selector:@selector(removeBullet:)],nil]];
        [self addChild:bullet z:1 tag:BULLET];
    }
    else if(bulletType == 5){
        [self createBullet:4 :targetPosition];
        [self createBullet:BULLETTYPE2 :[self anglePoint:[self getAngle:setUserPosition :setTargetPosition]+15 :setUserPosition :targetPosition]];
        [self createBullet:BULLETTYPE2 :[self anglePoint:[self getAngle:setUserPosition :setTargetPosition]-15 :setUserPosition :targetPosition]];
        
    }

}
-(CGPoint) anglePoint:(float)angle:(CGPoint)mainPosition:(CGPoint)targetPosition{
    float radian = angle / 180 * M_PI;
    float distance = [self getDistance:mainPosition :targetPosition];
    
    return CGPointMake(mainPosition.x + (distance * cos(radian)), mainPosition.y + (distance * sin(radian)));
}
-(float) getDistance:(CGPoint)mainPosition:(CGPoint)targetPosition{
    return 10; 
    //return pow(pow(targetPosition.x - mainPosition.x, 2)+pow(targetPosition.y - mainPosition.y, 2), 0.5);
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
-(void) removeBullet:(MyBullet*)sender{
    [sender release];
    [self removeChild:sender cleanup:YES];
}
-(void) dealloc{
    while([[self children]count])
        [self removeBullet:(MyBullet*)[self getChildByTag:BULLET]];
    [super dealloc];
}
@end
