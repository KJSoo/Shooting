//
//  MyAttack.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MyAttack.h"


@implementation MyAttack
-(id) init{
    if(self = [super init]){
    }
    return self;
}
-(void) attack:(CGPoint)userPosition:(CGPoint)targetPosition{
    setUserPosition = userPosition; setTargetPosition = targetPosition;
    int bulletType = [UserInfo sharedUserInfo].myBullet;
    bulletType = 3;
    [self createBullet:bulletType]; 
}
-(void) createBullet:(int)bulletType{
    if(bulletType == 1){
        MyBullet *bullet = [[MyBullet alloc]init:setUserPosition:setTargetPosition:bulletType];
        [bullet runAction:[CCSequence actions:[CCMoveTo actionWithDuration:bullet.bulletSpeed position:bullet.destinationPosition],[CCCallFuncN actionWithTarget:self selector:@selector(removeBullet:)],nil]];
        [self addChild:bullet];
    }else if(bulletType == 2){
        if((setUserPosition.x - setTargetPosition.x < 5) && (setUserPosition.x - setTargetPosition.x > -5)){
            setTargetPosition.x += 5;
            [self createBullet:1];
            setTargetPosition.x -= 10;
            [self createBullet:1];
        }else{
            setTargetPosition.y += 5;
            [self createBullet:1];
            setTargetPosition.y -= 10;
            [self createBullet:1];
        }
    }else if(bulletType == 3){
        [self createBullet:1];
        [self createBullet:2];
    }

}
-(void) removeBullet:(MyBullet*)sender{
    [sender release];
    [self removeChild:sender cleanup:YES];
}
@end
