//
//  Enemy.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 28..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "UserInfo.h"

@interface Enemy : CCSprite {
    int hp,power,level,exp;
    int presentAppearFrame,appearFrameCount,presentMoveFrame,moveFrameCount;
    BOOL appear,plus;
    float speed;
    CCSpriteFrame *appearFrame[10],*moveFrame[10];
}
@property BOOL appear;
-(id) initWithBatchNode:(CCSpriteBatchNode*)batchNode level:(int)enemyLevel;
-(void) appearAnimation;
-(void) movePattern;
-(void) moveUser;
@end
