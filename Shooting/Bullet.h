//
//  Bullet.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 24..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Bullet : CCSprite {
    CGPoint destinationPosition;
    float bulletPower,bulletSpeed;
    BOOL isHitting;
}
@property CGPoint destinationPosition;
@property float bulletPower,bulletSpeed;
@property BOOL isHtiing;
-(id) init:(CGPoint)userPosition:(CGPoint)targetPosition:(int)bulletType;
-(void) setHitting;
-(void) settingDestinationPosition:(CGPoint) userPosition :(CGPoint) targetPosition:(int)space;// 총알의 목적지 좌표 설정
-(CGPoint) destination:(CGPoint) userPosition :(CGPoint) targetPosition:(int)space;
@end
