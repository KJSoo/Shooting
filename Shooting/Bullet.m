//
//  Bullet.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 24..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"


@implementation Bullet
@synthesize destinationPosition;
@synthesize bulletPower,bulletSpeed;
-(id) init:(CGPoint)userPosition:(CGPoint)targetPosition:(int)bulletType{
    return self;
}
-(void) settingDestinationPosition:(CGPoint) userPosition :(CGPoint) targetPosition{ // 총알의 목적지 좌표 설정
    float m, n;
    float xy[2][2];
    // A,B1,C 원과 직선으로부터 얻어지는 2차방정식의 계수들
    // D: 판별식
    // X,Y: 교점의 좌표
    float A, B1, C, D;
    
    // A,B1,C,D게산
    if( (int) targetPosition.x!= (int)userPosition.x )
    {
        // m, n계산
        m = (targetPosition.y-userPosition.y)/(targetPosition.x-userPosition.x);
        n = (userPosition.y*targetPosition.x-userPosition.x*targetPosition.y)/(targetPosition.x-userPosition.x);
        
        A = m*m + 1;
        B1= (m*n-m*userPosition.y-userPosition.x);
        C = (userPosition.x*userPosition.x + userPosition.y*userPosition.y - 500 * 500 + n*n - 2*n*userPosition.y);
        D = B1*B1 - A*C;
        if(D < 0 )
            return;
        xy[0][0] = -(B1 + sqrt(D))/A;
        xy[0][1] = m*xy[0][0] + n;
        
        xy[1][0] = -(B1 - sqrt(D))/A;
        xy[1][1] = m*xy[1][0] + n;
    }
    else //x1 == x2
    {
        xy[0][0] = userPosition.x;
        xy[0][1] = userPosition.y+500;
        
        xy[1][0] = userPosition.x;
        xy[1][1] = userPosition.y-500;
        
    }
    if(pow(pow((targetPosition.x - xy[0][0]),2)+ pow((targetPosition.y-xy[0][1]),2), 0.5) < pow(pow((targetPosition.x - xy[1][0]),2)+ pow((targetPosition.y-xy[1][1]),2), 0.5))
        destinationPosition = ccp(xy[0][0],xy[0][1]);
    else {
        destinationPosition = ccp(xy[1][0],xy[1][1]);
    }
}
@end
