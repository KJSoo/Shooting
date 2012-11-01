//
//  gameMenuLayer.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "UserInfo.h"
@interface GameMenuLayer : CCLayer {
    UserInfo *info;
    float piece;
    CCSpriteBatchNode *hpBatch;
}
-(void) hpChange;
@end
