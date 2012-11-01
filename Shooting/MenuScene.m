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
        
        info = [UserInfo sharedUserInfo];
	}
	return self;
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
