//
//  MyBullet.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MyBullet.h"


@implementation MyBullet
-(id) init:(CGPoint)userPosition:(CGPoint)targetPosition:(int)bulletType{
    if(bulletType == 1){
        self = [super initWithFile:@"myBullet1.png"];
        bulletSpeed = 1.8;
        bulletPower = 10;
    }
    [self settingDestinationPosition:userPosition :targetPosition];
    self.position = userPosition;
    return self;
}
-(void) dealloc{
    [super dealloc];
}
@end
