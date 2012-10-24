//
//  MyAttack.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 25..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MyBullet.h"

@interface MyAttack :CCNode{
}
-(void) attack:(CGPoint)userPosition:(CGPoint)targetPosition;
@end
