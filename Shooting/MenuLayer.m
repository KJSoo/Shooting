//
//  MenuLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 13..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
#import "GameScene.h"
#import "ShopScene.h"

enum {STATUS = 100,STORE,SETTING,INVITE,INBOX,START};

@implementation MenuLayer
-(id) init{
    if(self = [super init]){
        [self createAboveItem];
        [self createBelowItem];
        [self createInbox];
        [self createinvite];
        [self createSetting];
    }
    return self;
}
-(void) createAboveItem{
    //start = [CCMenuItemImage itemFromNormalImage:@"start.png" selectedImage:@"start.png" target:self selector:@selector(selectItem:)];
    start = [CCMenuItemImage itemFromNormalImage:@"start_nface.png" selectedImage:@"start_nface.png" target:self selector:@selector(selectItem:)];
    start.tag = START;
    start.anchorPoint = ccp(0,0);
    start.position = ccp(0,64);
    
    AboveMenuNavigation = [CCMenu menuWithItems:start, nil];
    AboveMenuNavigation.anchorPoint = ccp(0,0);
    AboveMenuNavigation.position = ccp(0,0);
    //[self addChild:AboveMenuNavigation];

}
-(void) createBelowItem{
    status = [CCMenuItemImage itemFromNormalImage:@"status.png" selectedImage:@"status.png" target:self selector:@selector(selectItem:)];
    status.tag = STATUS;
    status.anchorPoint = ccp(0,0);
    status.position = ccp(0,0);
    
    store = [CCMenuItemImage itemFromNormalImage:@"store.png" selectedImage:@"store.png" target:self selector:@selector(selectItem:)];
    store.tag = STORE;
    store.anchorPoint = ccp(0,0);
    store.position = ccp(64 * 1,0);
    
    invite = [CCMenuItemImage itemFromNormalImage:@"invite.png" selectedImage:@"invite.png" target:self selector:@selector(selectItem:)];
    invite.tag = INVITE;
    invite.anchorPoint = ccp(0,0);
    invite.position = ccp(64 * 2,0);
    
    inbox = [CCMenuItemImage itemFromNormalImage:@"inbox.png" selectedImage:@"inbox.png" target:self selector:@selector(selectItem:)];
    inbox.tag = INBOX;
    inbox.anchorPoint = ccp(0,0);
    inbox.position = ccp(64 * 3,0);
    
    setting = [CCMenuItemImage itemFromNormalImage:@"setting.png" selectedImage:@"setting.png" target:self selector:@selector(selectItem:)];
    setting.tag = SETTING;
    setting.anchorPoint = ccp(0,0);
    setting.position = ccp(64 * 4,0);
    
    belowMenuNavigation = [CCMenu menuWithItems:status,store,invite,inbox,setting, nil];
    belowMenuNavigation.anchorPoint = ccp(0,0);
    belowMenuNavigation.position = ccp(0,0);
    [self addChild:belowMenuNavigation];
}
-(void) createinvite{
    inviteLayer = [[CCLayer alloc]init];
    CCSprite *ipop = [CCSprite spriteWithFile:@"settingPOPUP.png"];
    ipop.anchorPoint = ccp(0.58,0);
    ipop.position = ccp(invite.position.x + invite.contentSize.width/2,invite.position.y+invite.contentSize.height);
    [inviteLayer addChild:ipop];
    inviteLayer.visible = NO;
    [self addChild:inviteLayer];
}
-(void) createInbox{
    inboxLayer = [[CCLayer alloc]init];
    CCSprite *bpop = [CCSprite spriteWithFile:@"settingPOPUP.png"];
    bpop.anchorPoint = ccp(1,0);
    bpop.position = ccp(inbox.position.x + inbox.contentSize.width,inbox.position.y+inbox.contentSize.height);
    [inboxLayer addChild:bpop];
    inboxLayer.visible = NO;
    [self addChild:inboxLayer];
}
-(void) createSetting{
    settingLayer = [[MenuSettingLayer alloc]init];
    [self addChild:settingLayer];
}
-(void) allInvisible{
    selectMenu = NO;
    inviteLayer.visible = NO;
    inboxLayer.visible = NO;
    settingLayer.visible = NO;
}
-(void)selectItem:(CCMenuItem*)item{
    switch (item.tag) {
        case START:
            if(selectMenu){
                [self allInvisible];
                return;
            }
            [[CCDirector sharedDirector]replaceScene:[GameScene scene]];
            break;
        case INVITE:
            if(inviteLayer.visible == YES){
                [self allInvisible];
                return;
            }
            if(selectMenu)
                [self allInvisible];
            selectMenu = YES;
            inviteLayer.visible = YES;
            break;
        case INBOX:
            if(inboxLayer.visible == YES){
                [self allInvisible];
                return;
            }
            if(selectMenu)
                [self allInvisible];
            selectMenu = YES;
            inboxLayer.visible = YES;
            break;
        case SETTING:
            if(settingLayer.visible == YES){
                [self allInvisible];
                return;
            }
            if(selectMenu)
                [self allInvisible];
            selectMenu = YES;
            settingLayer.visible = YES;
            break;
        default:
            break;
    }
}
-(void) dealloc{
    NSLog(@"menulayer release");
    [settingLayer release];
    [inboxLayer release];
    [inviteLayer release];
    [super dealloc];
}
@end
