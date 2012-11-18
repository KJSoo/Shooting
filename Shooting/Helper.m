//
//  Helper.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 4..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "Helper.h"
#import "Character.h"

#define ATTACK 1
#define DEFENCE 2
#define BUFF 3

@implementation Helper
-(id) init:(int)type:(Character*)charc{
    if(type == 1){
        self = [super initWithFile:@"helper1.png"]; 
        myType = ATTACK;
    }
    side = [charc getSide];
    target = [charc getTarget];
    self.position = side.position;
    motionScopeStandard = side.contentSize.width;
    if(motionScopeStandard % 2)
        ++motionScopeStandard;
    isRight = NO;
    return self;
}
-(int) returnType{
    if(myType == ATTACK)
        [self schedule:@selector(leftRight)];
    return myType;
}
-(void) leftRight{
    float angle;
    if(isRight){
        if(isStandard == NO){
            angle  = [self getAngle:side.position :target.position]-90;
            if(angle < 0)
                angle += 360;
            motionScope += 2;
            self.position = [self anglePoint:angle :motionScope :side.position];
            if(motionScope == motionScopeStandard){
                isStandard = YES;
            }
        }
        else{
            angle  = [self getAngle:side.position :target.position]-90;
            if(angle < 0)
                angle += 360;
            motionScope -= 2;
            self.position = [self anglePoint:angle :motionScope :side.position];
            if(motionScope == 0){
                isRight = NO;
                isStandard = NO;
            }
        }
    }else{
        if(isStandard == NO){
            isStandard = NO;
            angle  = [self getAngle:side.position :target.position]+90;
            angle = (int)angle%360;
            motionScope += 2;
            self.position = [self anglePoint:angle :motionScope :side.position];
            if(motionScope == motionScopeStandard){
                isStandard = YES;
            }
        }else{
            angle  = [self getAngle:side.position :target.position]+90;
            angle = (int)angle%360;
            motionScope -= 2;
            self.position = [self anglePoint:angle :motionScope :side.position];
            if(motionScope == 0){
                isRight = YES;
                isStandard = NO;
            }
        }
    }

}
-(CGPoint) anglePoint:(float)angle:(float)dis:(CGPoint)mainPosition{
    float radian = angle / 180 * M_PI;
    float distance = dis;
    
    return CGPointMake(mainPosition.x + (distance * cos(radian)), mainPosition.y + (distance * sin(radian)));
}
-(float) getDistance:(CGPoint)mainPosition:(CGPoint)targetPosition{
    return pow(pow(targetPosition.x - mainPosition.x, 2)+pow(targetPosition.y - mainPosition.y, 2), 0.5);
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
@end
