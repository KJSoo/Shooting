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
    unsigned int bulletID;
    BOOL isHitting,isAnimation;
}
@property CGPoint destinationPosition;
@property float bulletPower,bulletSpeed;
@property unsigned int bulletID;
@property BOOL isHtiing,isAnimation;
-(id) init:(CGPoint)userPosition:(CGPoint)targetPosition:(int)bulletType:(int)angle;
-(void) settingDestinationPosition:(CGPoint) userPosition :(CGPoint) targetPosition:(int)space;// 총알의 목적지 좌표 설정
-(CGPoint) destination:(CGPoint) userPosition :(CGPoint) targetPosition:(int)space;
@end
