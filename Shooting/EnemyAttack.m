//
//  EnemyAttack.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "EnemyAttack.h"

#define ENEMY 200
#define GOLD 100
@implementation EnemyAttack
@synthesize isRelease;
-(id) init{
    if(self = [super init]){
        enemyBatchNode = [[CCSpriteBatchNode alloc]initWithFile:@"enemy.png" capacity:100];
        [self addChild:enemyBatchNode z:2];
        delay = 1;
    }
    bulletArray = [[NSMutableArray alloc]init];
    goldArray = [[CCArray alloc]init];
    return self;
}
-(void) setmyWave:(int)wave{
    myWave = wave;
}
-(void) waveSetting{
    if(myWave == 1){
        [self createEnemy:1];
    }
    if(!isRelease)
        [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:delay-0.7],[CCCallFunc actionWithTarget:self selector:@selector(waveSetting)], nil]];
}
-(void) createEnemy:(int)level{
    if(level == 1){
        Enemy *tempEnemy = [[Enemy alloc]initWithBatchNode:enemyBatchNode level:level];
        [enemyBatchNode addChild:tempEnemy z:1 tag:ENEMY];
    }
}
-(int) hittingEnemy:(Enemy*)enemy:(MyBullet*)bullet{
    if([bulletArray containsObject:[NSNumber numberWithInt:bullet.bulletID]])
        return 0;
    else{
        [bulletArray addObject:[NSNumber numberWithInt:bullet.bulletID]];
        if([enemy hitting:bullet]){
            [self removeEnemy:enemy];
        }
        [self performSelector:@selector(removeID:) withObject:[NSNumber numberWithInt:bullet.bulletID] afterDelay:2];
        return 1;
    }
}
-(void) removeEnemy:(Enemy*)sender{
    Gold *gold = [[Gold alloc]init:sender];
    [self addChild:gold z:1 tag:GOLD];
    [goldArray addObject:gold];
    [sender release];
    [enemyBatchNode removeChild:sender cleanup:YES];
}
-(void) removeGold:(Gold*)gold{
    [gold release];
    [goldArray removeObject:gold];
    [self removeChild:gold cleanup:YES];
}
-(void) removeID:(NSNumber*)bulletID{
    [bulletArray removeObject:bulletID];
}
-(CCArray*) getEnemyArray{
    return [enemyBatchNode children];
}
-(CCArray*) getGoldArray{
    return goldArray;
}
-(void) dealloc{
    while([[enemyBatchNode children]count])
        [self removeEnemy:[enemyBatchNode getChildByTag:ENEMY]];
    while (1) {
        Gold *g = (Gold*)[self getChildByTag:GOLD];
        if(!g)
            break;
        [self removeGold:g];
    }
    [enemyBatchNode release];
    [bulletArray release];
    [goldArray release];
    NSLog(@"EnemyAttack release");
    [super dealloc];
}
@end
