//
//  Skill.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 7..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "Skill.h"
#import "Character.h"
@implementation Skill
-(id) init:(Character*)charc:(MyAttack*)attac{
    if(self = [super init]){
        character = charc;
        attack = attac;
        isDelay = NO;
    }
    return self;
}
-(void) skill{
    if(isDelay)
        return;
    int type = [UserInfo sharedUserInfo].skillType;
    if(type == 1){
        skillLevel = 1 + ([UserInfo sharedUserInfo].level)/10;
        [self allShoot];
    }
    isDelay = YES;
    delay = [UserInfo sharedUserInfo].delay;
    timer = [[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(coolTime) userInfo:nil repeats:YES]retain];
}
-(void) coolTime{
    --delay;
    if(delay == 0){
        isDelay = NO;
        [timer invalidate];
        [timer release];
    }
}
-(void) allShoot{
    if(skillLevel == 1){ // 0~9
        for(int i = 1 ; i <= 4; i ++)
            [self allShootAngle:90 * i];
    }else if(skillLevel == 2){ // 10 ~ 19
        for(int i = 1 ; i <= 8; i ++)
            [self allShootAngle:45 * i];
    }else if(skillLevel == 3){ // 20 ~ 29
        for(int i = 1 ; i <= 18; i ++)
            [self allShootAngle:20 * i];
    }else if(skillLevel == 4){ // 30
        skillLevel = 44;
        [character runAction:[CCSequence actions:[CCCallFuncN actionWithTarget:self selector:@selector(allShoot)],[CCDelayTime actionWithDuration:0.2],[CCCallFunc actionWithTarget:self selector:@selector(allShoot)], nil]];
    }else if(skillLevel == 44){
        for(int i = 1 ; i <= 18; i ++)
            [self allShootAngle:20 * i];
    }
}
-(void) allShootAngle:(float)angle{
    [attack attack:[character getSide].position :[attack anglePoint:angle :[character getSide].position :ccp(0,0)]];

}
-(void) dealloc{
    NSLog(@"skill release");
    [super dealloc];
}
@end
