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
#import "MyBullet.h"

@interface Enemy : CCSprite {
    unsigned int enemyID;
    int hp,power,level,exp;
    int presentAppearFrame,appearFrameCount,presentMoveFrame,moveFrameCount;
    BOOL appear,plus,die;
    float speed;
    CCSpriteFrame *appearFrame[10],*moveFrame[10];
    id moveAction;
}
@property BOOL appear;
@property int hp,power,exp;
@property unsigned int enemyID;
-(id) initWithBatchNode:(CCSpriteBatchNode*)batchNode level:(int)enemyLevel;
-(void) appearAnimation;
-(void) movePattern;
-(void) moveUser;
-(int) hitting:(MyBullet*)bullet;
@end
