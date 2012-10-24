//
//  GameScene.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene
+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];

    // 'layer' is an autorelease object.
    GameScene *layer = [GameScene node];

    // add layer as a child to scene
    [scene addChild: layer];

    // return the scene
    return scene;
}
-(id) init{
    if(self = [super init]){
        bg = [[BackgroundLayer alloc]init];
        [bg gameScene];
        [self addChild:bg]; // add background
        
        gameMenuLayer = [[GameMenuLayer alloc]init];
        [self addChild:gameMenuLayer];
        
        gameActionLayer = [[GameActionLayer alloc]init];
        [self addChild:gameActionLayer];
    }
    return self;
}
-(void) dealloc{
    [bg release];
    [gameMenuLayer release];
    [gameActionLayer release];
    [super dealloc];
}
@end
