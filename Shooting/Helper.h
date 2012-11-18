//
//  Helper.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 4..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@class Character;
@interface Helper : CCSprite {
    int level;
    int exp;
    int myType;
    
    bool isRight,isStandard;
    int motionScope,motionScopeStandard;
    
    CCSprite *side,*target;
}
-(id) init:(int)type:(Character*)charc;
-(int) returnType;
-(void) leftRight;

-(CGPoint) anglePoint:(float)angle:(float)dis:(CGPoint)mainPosition;
-(float) getDistance:(CGPoint)mainPosition:(CGPoint)targetPosition;
-(float) getAngle:(CGPoint)mainPosition:(CGPoint)targetPostion;
@end
