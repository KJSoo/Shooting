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
    int bulletType = [UserInfo sharedUserInfo].myBullet;
    bulletType = 2;
    if(bulletType == 1){
        MyBullet *bullet = [[MyBullet alloc]init:userPosition:targetPosition:bulletType];
        [bullet runAction:[CCSequence actions:[CCMoveTo actionWithDuration:bullet.bulletSpeed position:bullet.destinationPosition],[CCCallFuncN actionWithTarget:self selector:@selector(removeBullet:)],nil]];
        [self addChild:bullet];
    }else if(bulletType == 2){
        MyBullet *bullet = [[MyBullet alloc]init:userPosition:CGPointMake(targetPosition.x, targetPosition.y+5):1];
        [bullet runAction:[CCSequence actions:[CCMoveTo actionWithDuration:bullet.bulletSpeed position:bullet.destinationPosition],[CCCallFuncN actionWithTarget:self selector:@selector(removeBullet:)],nil]];
        [self addChild:bullet];
        MyBullet *bullet2 = [[MyBullet alloc]init:userPosition:CGPointMake(targetPosition.x, targetPosition.y-5):1];
        [bullet2 runAction:[CCSequence actions:[CCMoveTo actionWithDuration:bullet2.bulletSpeed position:bullet2.destinationPosition],[CCCallFuncN actionWithTarget:self selector:@selector(removeBullet:)],nil]];
        [self addChild:bullet2];
    }
}
-(void) removeBullet:(MyBullet*)sender{
    [sender release];
    [self removeChild:sender cleanup:YES];
}
@end
