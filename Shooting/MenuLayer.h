//
//  MenuLayer.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 13..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MenuSettingLayer.h"
@interface MenuLayer : CCLayer {
    CCMenuItem *status,*store,*invite,*inbox,*setting,*start;
    CCMenu *belowMenuNavigation,*AboveMenuNavigation;
    
    CCLayer *inviteLayer,*inboxLayer;
    MenuSettingLayer *settingLayer;
    
    bool selectMenu;
}
-(void) createAboveItem;
-(void) createBelowItem;

-(void) createinvite;
-(void) createInbox;
-(void) createSetting;

-(void)selectItem:(CCMenuItem*)item;
@end
