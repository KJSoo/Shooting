//
//  LoadingScene.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "LoadingScene.h"
#import "MenuScene.h"
#import "GameScene.h"

@implementation LoadingScene
+(id) scene
{
    CCScene *scene=[CCScene node];
    LoadingScene *layer=[LoadingScene node];
    [scene addChild:layer];
    return scene;
}

-(id) init
{
    if((self=[super init]))
    {
        count=0;
        
        label=[CCLabelTTF labelWithString:@"Loading..." fontName:@"Marker Felt" fontSize:20]; 
        label.position=ccp(240,160);
        [self addChild:label];
        
        loadingbar=[CCSprite spriteWithFile:@"cloud1.png"];
        loadingbar.anchorPoint=CGPointZero;
        loadingbar.scaleX=0;
        [self addChild:loadingbar];
        
        frame=[CCSprite spriteWithFile:@"cloud1.png"];
        frame.anchorPoint=CGPointZero;
        [self addChild:frame];
        
        
        [self scheduleUpdate];
        
    }
    return self;
}

-(void) update:(ccTime) delta
{    
    loadingbar.scaleX+=0.01f; //please ignore this. Its just a simulation.
    if(loadingbar.scaleX >= 1)
    {
        [[CCDirector sharedDirector] replaceScene:[MenuScene scene]];
    }
    
}
@end
