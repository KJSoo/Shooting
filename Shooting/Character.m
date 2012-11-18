//
//  Character.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 24..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "Character.h"
#import "MenuScene.h"
#import "SimpleAudioEngine.h"

#define BEGIN 1
#define MOVED 2
#define ENDED 3
@implementation Character
@synthesize magnetism;
-(id) init{
    if( self = [super init]){
        //self.position = ccp(160,240);
        int characterType = [UserInfo sharedUserInfo].character;
        side = [[CCSprite alloc]initWithFile:@"side.png"];
        target = [[CCSprite alloc]initWithFile:@"target.png"];
        skin = [CCSprite alloc];
        if(characterType == 1){
            skin = [skin initWithFile:@"c1.png"];
            skin.position = ccp(160,240+11);
            hp = 100;
            magnetism = 80;
        }else if(characterType == 2){
        }else if(characterType == 3){
        
        }else if(characterType == 4){
        
        }else {
            NSLog(@"Error characterType : Object Character.m");
        }
        [UserInfo sharedUserInfo].originalHP = hp;
        [UserInfo sharedUserInfo].hp = hp;
        space = side.contentSize.width/2 + target.contentSize.width/2 + 5;//과녁과 캐릭터 사의에 간격
        side.position = ccp(160,240);
        target.position = ccp(160,240);
        [self addChild:side];
        [self addChild:target];
        
        attack = [[MyAttack alloc] init];
        [self addChild:attack];
        [self attack:YES];
        
        mySkill = [[Skill alloc]init:self :attack];
        
        sens = [UserInfo sharedUserInfo].sensitive;
        attackArray = [[NSMutableArray alloc]init];
        
        [self addChild:skin];
        [self schedule:@selector(recovery) interval:1];
        
        helper[0] = [[Helper alloc]init:1 :self];
        helper[1] = [Helper alloc];
        helper[2] = [Helper alloc];
        
        [self addChild:helper[0]];
        [helper[0] returnType];
    }
    return self;
}
-(void) setPositions:(CGPoint)position mode:(int)mode{
    if(mode == BEGIN)
        prePosition = position;
    else if(mode == MOVED){
        [self moveCharacter:CGPointMake(position.x - prePosition.x, position.y - prePosition.y)];
         prePosition = position;
    }
    else if(mode == ENDED)
        prePosition = position;
}
-(void) moveCharacter:(CGPoint)position{
    //좌 우 이동 체크.
    position = ccp(position.x * sens, position.y * sens);
    if((side.position.x + side.contentSize.width/2 + position.x <= 320 && position.x > 0) || (side.position.x - side.contentSize.width/2 + position.x >= 0 && position.x < 0))
        side.position = ccp(side.position.x + position.x, side.position.y);
    //상 하 이동 체크.
    if((side.position.y + side.contentSize.height/2 + position.y <= 480 && position.y > 0) || (side.position.y - side.contentSize.height/2 + position.y >= 0 && position.y < 0))
        side.position = ccp(side.position.x, side.position.y + position.y);
    skin.position = ccp(side.position.x,side.position.y+11);  //c1 position
    [self moveTarget];
}
-(void) moveTarget{
    float distance = pow(pow((side.position.x - target.position.x),2)+ pow((side.position.y-target.position.y),2), 0.5);
    // 두 객체사이의 거리
    if(distance < space){
    }else{
        target.position = [self intersection];
    }
}

-(CGPoint) intersection
{
    float m, n;
    float xy[2][2];
    // A,B1,C 원과 직선으로부터 얻어지는 2차방정식의 계수들
    // D: 판별식
    // X,Y: 교점의 좌표
    float A, B1, C, D;
    
    // A,B1,C,D게산
    if( (int) target.position.x!= (int)side.position.x )
    {
        // m, n계산
        m = (target.position.y-side.position.y)/(target.position.x-side.position.x);
        n = (side.position.y*target.position.x-side.position.x*target.position.y)/(target.position.x-side.position.x);
        
        A = m*m + 1;
        B1= (m*n-m*side.position.y-side.position.x);
        C = (side.position.x*side.position.x + side.position.y*side.position.y - space * space + n*n - 2*n*side.position.y);
        D = B1*B1 - A*C;
        if(D < 0 )
            return CGPointZero;
        xy[0][0] = -(B1 + sqrt(D))/A;
        xy[0][1] = m*xy[0][0] + n;
            
        xy[1][0] = -(B1 - sqrt(D))/A;
        xy[1][1] = m*xy[1][0] + n;
    }
    else //x1 == x2
    {
        xy[0][0] = side.position.x;
        xy[0][1] = side.position.y+space;

        xy[1][0] = side.position.x;
        xy[1][1] = side.position.y-space;

    }
    [target setRotation:(int)(target.rotation+5)%360];
    if(pow(pow((target.position.x - xy[0][0]),2)+ pow((target.position.y-xy[0][1]),2), 0.5) < pow(pow((target.position.x - xy[1][0]),2)+ pow((target.position.y-xy[1][1]),2), 0.5))
        return ccp(xy[0][0],xy[0][1]);
    else {
        return ccp(xy[1][0],xy[1][1]);
    }
}
-(void) recovery{
    if(hp + 5 <= [UserInfo sharedUserInfo].originalHP)
        hp += 5;
    else if(hp + 5 > [UserInfo sharedUserInfo].originalHP)
        hp = [UserInfo sharedUserInfo].originalHP;
    [UserInfo sharedUserInfo].hp = hp;
}
-(void) attack:(BOOL)present{
    if(present == YES){
        shootSpeed = [UserInfo sharedUserInfo].shootSpeed;
        [self schedule:@selector(shootBullet) interval:shootSpeed];
    }
    else if(present == NO)
        [self unscheduleAllSelectors];
}
-(void) shootBullet{
    [UserInfo sharedUserInfo].userPosition = side.position;
    [attack attack:side.position :target.position];
    [attack petAttack:helper[0].position :target.position :100];
    
    if(shootSpeed != [UserInfo sharedUserInfo].shootSpeed){
        [self attack:NO];
        [self attack:YES];
    }
}
-(void) hitting:(Enemy*)enemy{
    if([attackArray containsObject:[NSNumber numberWithInt:enemy.enemyID]]){
        
    }else{
        [attackArray addObject:[NSNumber numberWithInt:enemy.enemyID]];
        hp -= enemy.power;
        NSLog(@"HP %d",hp);
        if(hp<= 0){
            [[CCDirector sharedDirector] replaceScene:[MenuScene scene]];
            [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
            NSLog(@"die");
        }
        [self performSelector:@selector(removeID:) withObject:[NSNumber numberWithInt:enemy.enemyID] afterDelay:1];
    }
    [UserInfo sharedUserInfo].hp = hp;
}

-(void) skill{
    [mySkill skill];
}

-(void) removeID:(NSNumber*)enemyID{
    [attackArray removeObject:enemyID];
}
-(CCArray*) getAttack{
    return [attack children];
}
-(CCSprite*) getSide{
    return side;
}
-(CCSprite*) getTarget{
    return target;
}
-(MyAttack*) getMyAttack{
    return attack;
}
-(void) dealloc{
    NSLog(@"Character release");
    [side release];
    [target release];
    [attack release];
    [attackArray release];
    [skin release];
    [mySkill release];
    [self removeAllChildrenWithCleanup:YES];
    
    [helper[0] release];
    [helper[1] release];
    [helper[2] release];
    
    [super dealloc];
}
@end
