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

@interface MenuScene : CCLayer {
    BackgroundLayer *bg;
    CCMenuItem *gameScene,*shopScene;;
    CCMenu *menuNavigation;
}
+(CCScene *) scene;
-(void) selectMenu:(id)sender;
@end
