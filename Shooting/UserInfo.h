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
    int character,myBullet,amountMoney,exp,level;// 각각 캐릭터, 총알 레벨, 보유 자산
    int sensitive; // 감도
    float shootSpeed;
    CGPoint userPosition;
    
    int money,point,hp,originalHP;
}
@property int character,myBullet,amountMoney,level,originalHP;
@property int sensitive;
@property int money,point,exp,hp;
@property float shootSpeed;
@property CGPoint userPosition;
+(UserInfo*) sharedUserInfo;
@end
