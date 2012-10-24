//
//  ShopScene.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "ShopScene.h"


@implementation ShopScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	ShopScene *layer = [ShopScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
@end
