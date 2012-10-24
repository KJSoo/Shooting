//
//  UserInfo.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 24..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "UserInfo.h"


@implementation UserInfo
@synthesize character,myBullet,amountMoney;
@synthesize shootSpeed;
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
        character = 1;
        myBullet = 1;
        amountMoney = 0;
        shootSpeed = 0.15;
    }
    return self;
}
@end

