//
//  GameActionLayer.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Character.h"
#import "EnemyAttack.h"

@interface GameActionLayer : CCLayer {
    Character *character;
    EnemyAttack *enemy;
}
-(void) checkCrash;
-(void) characterWithMonstars;
-(void) cBulletWithMonstars;
-(void) moveGold;
-(void) characterWithGold;

-(float) pointDistance:(CGPoint)firstPoint:(CGPoint)secondPoint;
@end
