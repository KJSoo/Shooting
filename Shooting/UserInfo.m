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
@synthesize sensitive;
@synthesize shootSpeed;
@synthesize userPosition;
@synthesize money,point,exp,hp,originalHP;
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
        
        character = 1;
        myBullet = 5;
        amountMoney = 0;
        sensitive = 2;
        shootSpeed = 0.2;
    }
    return self;
}
@end

