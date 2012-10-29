//
//  EnemyAttack.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "EnemyAttack.h"


@implementation EnemyAttack
-(id) init{
    if(self = [super init]){
        enemyBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"enemy.png"];
        [self addChild:enemyBatchNode];
        delay = 1;
    }
    return self;
}
-(void) setmyWave:(int)wave{
    myWave = wave;
}
-(void) waveSetting{
    if(myWave == 1){
        [self createEnemy:1];
    }
    [self performSelector:@selector(waveSetting) withObject:nil afterDelay:delay];
}
-(void) createEnemy:(int)level{
    if(level == 1){
        [enemyBatchNode addChild:[[Enemy alloc]initWithBatchNode:enemyBatchNode level:level]];
    }
}
-(void) hittingEnemy:(Enemy*)enemy:(MyBullet*)bullet{
    if([enemy hitting:bullet]){
        [self removeEnemy:enemy];
    }
}
-(void) removeEnemy:(Enemy*)sender{
    [sender release];
    [enemyBatchNode removeChild:sender cleanup:YES];
}
-(CCArray*) getEnemyArray{
    return [enemyBatchNode children];
}
@end
