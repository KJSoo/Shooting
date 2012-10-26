//
//  GameDebugLayer.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 26..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "GameDebugLayer.h"
enum {SP,SM,BP,BM};

@implementation GameDebugLayer
-(id) init{
    if(self = [super init]){
        sP = [CCMenuItemFont itemFromString:@"+" target:self selector:@selector(selectMenu:)];
        sP.tag = SP;
        sP.position = ccp(20,460);
        sM = [CCMenuItemFont itemFromString:@"-" target:self selector:@selector(selectMenu:)];
        sM.tag = SM;
        sM.position = ccp(20,400);
        
        bP = [CCMenuItemFont itemFromString:@"+" target:self selector:@selector(selectMenu:)];
        bP.tag = BP;
        bP.position = ccp(60,460);
        bM = [CCMenuItemFont itemFromString:@"-" target:self selector:@selector(selectMenu:)];
        bM.tag = BM;
        bM.position = ccp(60,400);
        
        menu = [CCMenu menuWithItems:sP,sM,bP,bM, nil];
        menu.anchorPoint = CGPointZero;
        menu.position = CGPointZero;
        [self addChild:menu];
    }
    return self;
}
-(void) selectMenu:(CCMenuItemFont*)sender{
    if(sender.tag == SP)
        [UserInfo sharedUserInfo].shootSpeed -= 0.01;
    else if(sender.tag == SM)
        [UserInfo sharedUserInfo].shootSpeed += 0.01;
    else if(sender.tag == BP)
        [UserInfo sharedUserInfo].myBullet++;
    else if(sender.tag == BM)
        [UserInfo sharedUserInfo].myBullet--;
}
@end
