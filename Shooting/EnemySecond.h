//
//  EnemySecond.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 5..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"
@interface EnemySecond : Enemy {
    int circle;
    float startAngle,endAngle;
    bool phase,turn;
    CGPoint centerPosition;
}
-(CGPoint) anglePoint:(float)angle:(float)dis:(CGPoint)mainPosition;
-(float) getDistance:(CGPoint)mainPosition:(CGPoint)targetPosition;
-(float) getAngle:(CGPoint)mainPosition:(CGPoint)targetPostion;
@end
