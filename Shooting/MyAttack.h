//
//  MyAttack.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MyBullet.h"

@interface MyAttack :CCNode{
    CGPoint setUserPosition,setTargetPosition;
    CCSpriteBatchNode *bulletAnimationSprite;
    NSMutableArray *animationArray;
    CCAnimation *animation;
}
-(void) attack:(CGPoint)userPosition:(CGPoint)targetPosition;
-(void) petAttack:(CGPoint)userPosition:(CGPoint)targetPosition:(int)bulletType;
-(void) createBullet:(int)bulletType:(CGPoint)targetPosition;


-(CGPoint) anglePoint:(float)angle:(CGPoint)mainPosition:(CGPoint)targetPosition;
-(float) getDistance:(CGPoint)mainPosition:(CGPoint)targetPosition;
-(float) getAngle:(CGPoint)mainPosition:(CGPoint)targetPostion;
-(void) removeBullet:(MyBullet*)sender;
-(void) removeAnimationBullet:(id)sender:(MyBullet*)bullet;
@end
