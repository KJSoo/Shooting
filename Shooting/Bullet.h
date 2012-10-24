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
}
@property CGPoint destinationPosition;
@property float bulletPower,bulletSpeed;
-(id) init:(CGPoint)userPosition:(CGPoint)targetPosition:(int)bulletType;
-(void) settingDestinationPosition:(CGPoint) userPosition :(CGPoint) targetPosition; // 총알의 목적지 좌표 설정
@end
