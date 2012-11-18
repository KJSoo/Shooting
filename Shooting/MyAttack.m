//
//  MyAttack.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MyAttack.h"
#import "SimpleAudioEngine.h"
#define BULLET 100
#define BULLETTYPE2 -2
@implementation MyAttack
-(id) init{
    if(self = [super init]){
        bulletAnimationSprite = [[CCSpriteBatchNode alloc]initWithFile:@"bulletAnimation.png" capacity:1];
        animationArray = [[NSMutableArray alloc]init];
        int select = arc4random()%3;
        for(int i=0 ; i<6 ; i++){
            [animationArray addObject:[CCSpriteFrame frameWithTexture:bulletAnimationSprite.texture rect:CGRectMake(25*i, 25*select, 25, 25)]];
        }
        animation = [[CCAnimation alloc]initWithFrames:animationArray delay:0.05];
    }
    return self;
}
-(void) attack:(CGPoint)userPosition:(CGPoint)targetPosition{
    if([UserInfo sharedUserInfo].isEffect)
        [[SimpleAudioEngine sharedEngine]playEffect:@"bullet.mp3"];
    setUserPosition = userPosition; setTargetPosition = targetPosition;
    int bulletType = [UserInfo sharedUserInfo].myBullet;
    [self createBullet:bulletType:setTargetPosition]; 
}
-(void) petAttack:(CGPoint)userPosition:(CGPoint)targetPosition:(int)bulletType{
    setUserPosition = userPosition; setTargetPosition = targetPosition;
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
        
    }else if(bulletType == 100){// 100이후는 펫의 bullet
        MyBullet *bullet = [[MyBullet alloc]init:setUserPosition:targetPosition:100:0];
        [bullet runAction:[CCSequence actions:[CCMoveTo actionWithDuration:bullet.bulletSpeed position:bullet.destinationPosition],[CCCallFuncN actionWithTarget:self selector:@selector(removeBullet:)],nil]];
        [self addChild:bullet z:1 tag:BULLET];    }
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
    if(sender.isAnimation == NO && sender.isHtiing){
        [sender stopAllActions];
        sender.isAnimation = YES;
        [sender runAction:[CCSequence actions:[CCAnimate actionWithAnimation:animation restoreOriginalFrame:NO],[CCCallFuncND actionWithTarget:self selector:@selector(removeAnimationBullet::) data:sender], nil]];
    }
    if(sender.isHtiing == NO && sender.isAnimation == NO){
        [sender release];
        [self removeChild:sender cleanup:YES];
    }
}
-(void) removeAnimationBullet:(id)sender:(MyBullet*)bullet{
    [bullet release];
    [self removeChild:bullet cleanup:YES];
}
-(void) dealloc{
    while (1) {
        MyBullet *b = (MyBullet*)[self getChildByTag:BULLET];
        if(!b)
            break;
        [self removeAnimationBullet:nil:b];
    }
    [bulletAnimationSprite release];
    [animation release];
    [animationArray release];
    NSLog(@"myAttack release");
    [super dealloc];
}
@end
