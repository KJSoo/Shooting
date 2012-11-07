//
//  Skill.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 7..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@class Character;
@class MyAttack;
@interface Skill : CCSprite {
    Character *character;
    MyAttack *attack;
    int skillLevel;
    BOOL isDelay;
    int delay;
    
    id coolTimeAction;
    NSTimer *timer;
}
-(id) init:(Character*)charc:(MyAttack*)attac;
-(void) skill;
-(void) allShoot;
-(void) allShootAngle:(float)angle;
-(void) coolTime;
@end
