//
//  MenuScene.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BackgroundLayer.h"
#import "UserInfo.h"
#import "MenuLayer.h"

@interface MenuScene : CCLayer {
    BackgroundLayer *bg;
    UserInfo *info;
    MenuLayer *menuLayer;
}
+(CCScene *) scene;
@end
