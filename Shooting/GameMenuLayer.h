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
    
    int presentHP,combo;
    int time; // 시간
}
-(void) hpChange;
-(void) fillCombo;
-(void) refreshScore;
-(void) addTime;
@end
