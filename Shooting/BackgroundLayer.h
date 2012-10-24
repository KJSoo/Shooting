//
//  gameBackgroundLayer.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Cloud.h"

@interface BackgroundLayer : CCLayer {
    Cloud *cloud;
}
-(void) menuScene;
-(void) gameScene;
@end
