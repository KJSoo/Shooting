//
//  MenuSettingLayer.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 15..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MenuSettingLayer : CCLayer {
    CCMenuItem *effect_on_no,*effect_on_yes,*effect_off_no,*effect_off_yes;
    CCMenuItem *bgm_on_no,*bgm_on_yes,*bgm_off_no,*bgm_off_yes;
    CCMenuItem *close;
}
-(void) createMenuItem;
-(void)selectItem:(CCMenuItem*)item;
@end
