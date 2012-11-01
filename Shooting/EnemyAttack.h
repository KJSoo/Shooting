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
#import "Gold.h"
@interface EnemyAttack : CCNode {
    id selectWave;
    float delay;
    int myWave;
    BOOL isRelease;
    CCSpriteBatchNode *enemyBatchNode;
    CCArray* goldArray;
    NSMutableArray *bulletArray;
    
    NSMutableArray *dieAnimationArray;
    CCAnimation *animation;
}
@property BOOL isRelease;
-(void) setmyWave:(int)wave;
-(void) waveSetting;
-(void) createEnemy:(int)level;
-(int) hittingEnemy:(Enemy*)enemy:(MyBullet*)bullet;
-(void) removeGold:(Gold*)gold;
-(void) removeEnemy:(id)sender;
-(void) realRemoveEnemy:(Enemy*)enemy;
-(void) removeID:(id)bulletID;
-(CCArray*) getEnemyArray;
-(CCArray*) getGoldArray;
@end
