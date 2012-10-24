//
//  AppDelegate.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 10. 23..
//  Copyright __MyCompanyName__ 2012년. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
