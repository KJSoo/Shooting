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
#import "Enemy.h"
@interface Character : CCSprite {
    int character,sens,hp;
    float space,shootSpeed;;  //과녁과 캐릭터 사의에 간격
    BOOL unbeatable;
    CCSprite *side,*target;
    CGPoint prePosition;
    MyAttack *attack;
    NSMutableArray *attackArray;
}
-(void) setPositions:(CGPoint)position mode:(int)mode;
-(void) moveCharacter:(CGPoint)position;
-(void) moveTarget;
-(CGPoint) intersection;
-(void) attack:(BOOL)present;
-(void) shootBullet;
-(void) hitting:(Enemy*)enemy;
-(void) removeID:(id)enemyID;
-(CCArray*) getAttack;
-(CCSprite*) getSide;
@end
