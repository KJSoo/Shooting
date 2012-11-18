//
//  MenuScene.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "MenuScene.h"
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
        menuLayer = [[MenuLayer alloc]init];

        info = [UserInfo sharedUserInfo];
        if([UserInfo sharedUserInfo].loading == NO){
            CCSprite *logo = [CCSprite spriteWithFile:@"logo.png"];
            logo.anchorPoint = ccp(0,0);
            logo.position = ccp(0,0);
            [logo runAction:[CCSequence actions:[CCDelayTime actionWithDuration:3],[CCCallFuncN actionWithTarget:self selector:@selector(endLogo:)], nil]];
            [self addChild:logo z:10];
            [self loading];
        }else{
            [self addChild:menuLayer z:9];
        }
        bg = [[BackgroundLayer alloc]init];
        [bg menuScene];
        [self addChild:bg]; // add background
	
    }
	return self;
}
-(void) endLogo:(CCSprite*)sender{
    sender.opacity = 0;
    [UserInfo sharedUserInfo].loading = YES;
    [self addChild:menuLayer z:9];
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
    [menuLayer release];
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
