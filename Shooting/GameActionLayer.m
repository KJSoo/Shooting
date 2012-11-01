//
//  GameActionLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "GameActionLayer.h"
#define BEGIN 1
#define MOVED 2
#define ENDED 3

@implementation GameActionLayer
-(id) init{
    if( self = [super init]){
        self.isTouchEnabled = YES;
        character = [[Character alloc]init];
        [self addChild:character];
        
        enemy = [[EnemyAttack alloc]init];
        [self addChild:enemy];
        [enemy setmyWave:1];
        [enemy waveSetting];
        [self checkCrash];
        }
    return self;
}
-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{  
    UITouch*touch=[touches anyObject];
    CGPoint location=[touch locationInView:[touch view]];
    location=[[CCDirector sharedDirector] convertToGL:location];
    [character setPositions:location mode:BEGIN];
}
-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch*touch=[touches anyObject];
    CGPoint location=[touch locationInView:[touch view]];
    location=[[CCDirector sharedDirector] convertToGL:location];
    [character setPositions:location mode:MOVED];
}
-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [character setPositions:CGPointZero mode:ENDED];
}
-(void) checkCrash{
    [self characterWithMonstars];
    [self cBulletWithMonstars];
    [self moveGold];
    [self characterWithGold];
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.01],[CCCallFuncN actionWithTarget:self selector:@selector(checkCrash)], nil]];
}
-(void) characterWithMonstars{
    for( Enemy *tempEnemy in [enemy getEnemyArray]){
        if(tempEnemy.appear && tempEnemy.isDie == NO)
            if(tempEnemy.contentSize.width/2 + [character getSide].contentSize.width/2 > [self pointDistance:tempEnemy.position :[character getSide].position]){
                [character hitting:tempEnemy];
            }    //적 몬스터와 캐릭터의 충돌체크
        
    }
}
-(void) cBulletWithMonstars{
    for( Enemy *tempEnemy in [enemy getEnemyArray]){
        for(MyBullet* bullet in [character getAttack]){
            if(bullet.isHtiing == YES)
                continue;
            if(tempEnemy.contentSize.width/2 + bullet.contentSize.width/2 > [self pointDistance:tempEnemy.position :bullet.position]){
                if(tempEnemy.isDie == NO && [enemy hittingEnemy:tempEnemy :bullet] ){
                    [[character getMyAttack]removeBullet:bullet];
                    break;
                }
            }
        }// 캐릭터의 총알과 적 유닛의 충돌 체크
    }
}
-(void) moveGold{
    for( Gold *gold in [enemy getGoldArray])
        [gold moveToUser:character];
}
-(void) characterWithGold{
    bool isBreak;
    for( Gold *gold in [enemy getGoldArray]){
        if([self pointDistance:[character getSide].position :gold.position] < [character getSide].contentSize.width/2 + gold.contentSize.width/2){
            [UserInfo sharedUserInfo].money += gold.gold;
            [enemy removeGold:gold];
            isBreak = YES;
            break;
        }
        if(gold.timer == YES){
            [enemy removeGold:gold];
            isBreak = YES;
            break;
        }
        //if(isBreak)
        //    [self characterWithGold];
    }
}
-(float) pointDistance:(CGPoint)firstPoint:(CGPoint)secondPoint{
    return pow(pow(secondPoint.x - firstPoint.x,2) + pow(secondPoint.y - firstPoint.y, 2), 0.5);
}
-(void) dealloc{
    NSLog(@"GameActionLayer release");
    [character release];
    enemy.isRelease = YES;
    [enemy release];
    [super dealloc];
}
@end
