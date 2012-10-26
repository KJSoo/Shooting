//
//  Character.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 24..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "UserInfo.h"
#import "MyAttack.h"
@interface Character : CCSprite {
    int character;
    float space,shootSpeed;;  //과녁과 캐릭터 사의에 간격
    CCSprite *side,*target;
    CGPoint prePosition;
    MyAttack *attack;
}
-(void) setPositions:(CGPoint)position mode:(int)mode;
-(void) moveCharacter:(CGPoint)position;
-(void) moveTarget;
-(void) intersection;
-(void) attack:(BOOL)present;
-(void) shootBullet;
-(CCArray*) getAttack;
@end
