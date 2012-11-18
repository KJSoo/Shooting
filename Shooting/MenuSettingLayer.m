//
//  MenuSettingLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 15..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MenuSettingLayer.h"
#import "UserInfo.h"
enum {EFFECTON = 100,EFFECTOFF,BGMON,BGMOFF,CLOSE};
@implementation MenuSettingLayer
-(id) init{
    if( self = [super init] ){
        [self createMenuItem];
    }
    return self;
}
-(void) createMenuItem{
    self.visible = NO;

    CCSprite *pop = [CCSprite spriteWithFile:@"settingPOPUP.png"];
    pop.anchorPoint = ccp(1,0);
    pop.position = ccp(320,64);
    
    effect_on_no = [CCMenuItemImage itemFromNormalImage:@"on_no.png" selectedImage:@"on_no.png" target:self selector:@selector(selectItem:)];
    effect_on_yes = [CCMenuItemImage itemFromNormalImage:@"on_yes.png" selectedImage:@"on_yes.png" target:self selector:@selector(selectItem:)];  
    effect_on_no.position = ccp(240,225);
    effect_on_yes.position = ccp(240,225);
    effect_on_no.tag = EFFECTON;
    effect_on_yes.tag = EFFECTON;
    
    effect_off_no = [CCMenuItemImage itemFromNormalImage:@"off_no.png" selectedImage:@"off_no.png" target:self selector:@selector(selectItem:)];
    effect_off_yes = [CCMenuItemImage itemFromNormalImage:@"off_yes.png" selectedImage:@"off_yes.png" target:self selector:@selector(selectItem:)];    
    effect_off_no.position = ccp(285,225);
    effect_off_yes.position = ccp(285,225);
    effect_off_no.tag = EFFECTOFF;
    effect_off_yes.tag = EFFECTOFF;
    
    if([UserInfo sharedUserInfo].isEffect)
        effect_off_yes.visible = NO;
    else
        effect_on_yes.visible = NO;
    
    
    bgm_on_no = [CCMenuItemImage itemFromNormalImage:@"on_no.png" selectedImage:@"on_no.png" target:self selector:@selector(selectItem:)];
    bgm_on_yes = [CCMenuItemImage itemFromNormalImage:@"on_yes.png" selectedImage:@"on_yes.png" target:self selector:@selector(selectItem:)];
    bgm_on_no.position = ccp(240,180);
    bgm_on_yes.position = ccp(240,180);
    bgm_on_no.tag = BGMON;
    bgm_on_yes.tag = BGMON;
    
    bgm_off_no = [CCMenuItemImage itemFromNormalImage:@"off_no.png" selectedImage:@"off_no.png" target:self selector:@selector(selectItem:)];
    bgm_off_yes = [CCMenuItemImage itemFromNormalImage:@"off_yes.png" selectedImage:@"off_yes.png" target:self selector:@selector(selectItem:)];
    bgm_off_no.position = ccp(285,180);
    bgm_off_yes.position = ccp(285,180);
    bgm_off_no.tag = BGMOFF;
    bgm_off_yes.tag = BGMOFF;
    if([UserInfo sharedUserInfo].isBgm)
        bgm_off_yes.visible = NO;
    else
        bgm_on_yes.visible = NO;
    
    close = [CCMenuItemImage itemFromNormalImage:@"close.png" selectedImage:@"close.png" target:self selector:@selector(selectItem:)];
    close.anchorPoint = ccp(0.5,0);
    close.position = ccp(320 - pop.contentSize.width/2,90);
    close.tag = CLOSE;
    
    CCMenu *settingMenu = [CCMenu menuWithItems:effect_on_no,effect_on_yes,effect_off_no,effect_off_yes,bgm_on_no,bgm_on_yes,bgm_off_no,bgm_off_yes,close, nil];
    settingMenu.position = ccp(0,0);
    
    [self addChild:pop];
    [self addChild:settingMenu];
}
-(void)selectItem:(CCMenuItem*)item{
    switch (item.tag) {
        case EFFECTON:
            [UserInfo sharedUserInfo].isEffect = YES;
            effect_on_yes.visible = YES;
            effect_off_yes.visible = NO;
            break;
        case EFFECTOFF:
            [UserInfo sharedUserInfo].isEffect = NO;
            effect_off_yes.visible = YES;
            effect_on_yes.visible = NO;
            break;
        case BGMON:
            [UserInfo sharedUserInfo].isBgm = YES;
            bgm_on_yes.visible = YES;
            bgm_off_yes.visible = NO;
            break;
        case BGMOFF:
            [UserInfo sharedUserInfo].isBgm = NO;
            bgm_on_yes.visible = NO;
            bgm_off_yes.visible = YES;
            break;
        case CLOSE:
            self.visible = NO;
        default:
            break;
    }
}
@end
