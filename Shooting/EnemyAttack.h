//
//  EnemyAttack.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"
@interface EnemyAttack : CCNode {
    id selectWave;
    float delay;
    int myWave;
    BOOL isRelease;
    CCSpriteBatchNode *enemyBatchNode;
    NSMutableArray *bulletArray;
}
@property BOOL isRelease;
-(void) setmyWave:(int)wave;
-(void) waveSetting;
-(void) createEnemy:(int)level;
-(int) hittingEnemy:(Enemy*)enemy:(MyBullet*)bullet;
-(void) removeEnemy:(id)sender;
-(void) removeID:(id)bulletID;
-(CCSpriteBatchNode*) getEnemyArray;
@end
