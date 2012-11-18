//
//  UserInfo.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 24..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "UserInfo.h"


@implementation UserInfo
@synthesize character,myBullet,amountMoney,level;
@synthesize sensitive,skillType,delay;
@synthesize shootSpeed;
@synthesize userPosition;
@synthesize money,point,exp,hp,originalHP;
@synthesize loading,isEffect,isBgm;
static UserInfo *info=nil;
+(UserInfo*) sharedUserInfo{
    if(info == nil)
    {
        info = [[UserInfo alloc]init];
    }
    return info;
}
-(id) init{
    if( (self = [super init]) ){
        money=0;
        point=0;
        exp=0;
        hp=0;
        delay = 10;
        
        level = 30;
        character = 1;
        myBullet = 5;
        amountMoney = 0;
        sensitive = 2;
        skillType = 1;
        shootSpeed = 0.2;
        
        isEffect = YES;
        isBgm = YES;
        [self expTableInit];
    }
    return self;
}
-(void) expTableInit{
    expTable[0] = 1000;
    for(int i = 1 ; i < 30 ; i ++)
        expTable[i] = expTable[i-1] + expTable[i-1] * 0.2;
    for(int i = 0 ; i < 30 ; i ++)
        NSLog(@"%d",expTable[i]);
}
-(int*) getExpTable{
    return expTable;
}
@end

