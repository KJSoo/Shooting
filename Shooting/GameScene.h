//
//  GameScene.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BackgroundLayer.h"
#import "GameMenuLayer.h"
#import "GameActionLayer.h"

@interface GameScene : CCLayer {
    BackgroundLayer *bg;
    GameMenuLayer *gameMenuLayer;
    GameActionLayer *gameActionLayer;
}
+(CCScene *) scene;
@end
