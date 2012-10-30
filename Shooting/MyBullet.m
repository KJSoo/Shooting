//
//  MyBullet.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MyBullet.h"


@implementation MyBullet
-(id) init:(CGPoint)userPosition:(CGPoint)targetPosition:(int)bulletType:(int)angle{
    bulletID = arc4random();
    if(bulletType == 1){
        self = [super initWithFile:@"myBullet1.png"];
        bulletSpeed = 1.5;
        bulletPower = 10;
    }else if(bulletType == 2){
        self = [super initWithFile:[NSString stringWithFormat:@"bullettype_2_%d.png",angle/10]];
        bulletSpeed = 1.2;
        bulletPower = 15;
    }
   // if(userPosition.x == targetPosition.x && userPosition.y == targetPosition.y)
   //     targetPosition.x += 20;
    [self settingDestinationPosition:userPosition :targetPosition :500];
    self.position = userPosition;
    return self;
}
-(void) dealloc{
    [super dealloc];
}
@end
