//
//  saveInfo.h
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 18..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface saveInfo : NSObject
+(NSString*) GameDataFilePath:(NSString*) fileName;
+(void) GameSave;

+(BOOL)hasSavedGameData;
+(void)loadGameData;
+(void)deleteGameDataFile;


-(void) saveGameData;
@end
