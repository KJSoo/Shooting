//
//  EnemyAttack.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "EnemyAttack.h"

#define ENEMY 200
@implementation EnemyAttack
@synthesize isRelease;
-(id) init{
    if(self = [super init]){
        enemyBatchNode = [[CCSpriteBatchNode alloc]initWithFile:@"enemy.png" capacity:100];
        [self addChild:enemyBatchNode];
        delay = 1;
    }
    bulletArray = [[NSMutableArray alloc]init];
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
        [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:delay],[CCCallFunc actionWithTarget:self selector:@selector(waveSetting)], nil]];
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
        [self performSelector:@selector(removeID:) withObject:[NSNumber numberWithInt:bullet.bulletID] afterDelay:1];
        return 1;
    }
}
-(void) removeEnemy:(Enemy*)sender{
    [sender release];
    [enemyBatchNode removeChild:sender cleanup:YES];
    NSLog(@"%@    %d",sender,[sender retainCount]);
}
-(void) removeID:(NSNumber*)bulletID{
    [bulletArray removeObject:bulletID];
}
-(CCSpriteBatchNode*) getEnemyArray{
    return enemyBatchNode;
}
-(void) dealloc{
    NSLog(@"EnemyAttack release");
    while([[enemyBatchNode children]count])
        [self removeEnemy:[enemyBatchNode getChildByTag:ENEMY]];
    [enemyBatchNode release];
    [bulletArray release];
    [super dealloc];
}
@end
