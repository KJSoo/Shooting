//
//  UserInfo.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 24..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface UserInfo : NSObject
{
    int character,myBullet,amountMoney;// 각각 캐릭터, 총알 레벨, 보유 자산
    float shootSpeed;
}
@property int character,myBullet,amountMoney;
@property float shootSpeed;
+(UserInfo*) sharedUserInfo;
@end
