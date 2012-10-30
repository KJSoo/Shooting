//
//  Money.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 30..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"
#import "Character.h"
@interface Gold : CCSprite {
    int gold;
    bool stop;
    CCAction *moveRandomPosition;
}
@property int gold;
-(id) init:(Enemy*)enemy;
-(void) moveToUser:(Character*)user;
@end
