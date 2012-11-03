//
//  MenuScene.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MenuScene.h"
#import "GameScene.h"
#import "ShopScene.h"
#import "SimpleAudioEngine.h"
enum {GAMESCENE,SHOPSCENE};

@implementation MenuScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MenuScene *layer = [MenuScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        CCSprite *logo = [CCSprite spriteWithFile:@"Default.png"];
        logo.anchorPoint = ccp(0,0);
        logo.position = ccp(0,0);
        [logo runAction:[CCSequence actions:[CCDelayTime actionWithDuration:3],[CCCallFuncN actionWithTarget:self selector:@selector(endLogo:)], nil]];
        [self addChild:logo z:10];
        
        [self loading];
                
        bg = [[BackgroundLayer alloc]init];
        [bg menuScene];
        [self addChild:bg]; // add background
        
		gameScene = [CCMenuItemFont itemFromString:@"start" target:self selector:@selector(selectMenu:)];
        gameScene.tag = GAMESCENE;
        shopScene = [CCMenuItemFont itemFromString:@"shop" target:self selector:@selector(selectMenu:)];
        shopScene.tag = SHOPSCENE;
        menuNavigation = [CCMenu menuWithItems:gameScene,shopScene, nil];
        [menuNavigation alignItemsVertically];
        [self addChild:menuNavigation];
        menuNavigation.isTouchEnabled = NO;
        info = [UserInfo sharedUserInfo];
	}
	return self;
}
-(void) endLogo:(CCSprite*)sender{
    sender.opacity = 0;
    menuNavigation.isTouchEnabled = YES;
}
-(void) selectMenu:(id)sender{
    CCMenuItem *receive = sender;
    if(receive.tag == GAMESCENE){
        info.money = 0;
        info.hp = 0;
        info.point = 0;
        
        [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
    }else if(receive.tag = SHOPSCENE){
        [[CCDirector sharedDirector] replaceScene:[ShopScene scene]];
    }
}
-(void) loading{
    [[SimpleAudioEngine sharedEngine]preloadBackgroundMusic:@"gameBackground.mp3"];
    [[SimpleAudioEngine sharedEngine]preloadEffect:@"bullet.mp3"];
    [[SimpleAudioEngine sharedEngine]preloadEffect:@"gold.mp3"];
    [[SimpleAudioEngine sharedEngine]preloadEffect:@"hit.mp3"];
    [[SimpleAudioEngine sharedEngine]preloadEffect:@"monstarsdie.mp3"];

}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    [bg release];
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
