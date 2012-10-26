//
//  GameDebugLayer.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 26..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "UserInfo.h"

@interface GameDebugLayer : CCLayer {
    CCMenuItemFont *sP,*sM,*bP,*bM;
    CCMenu *menu;
}
-(void) selectMenu:(CCMenuItemFont*)sender;
@end
