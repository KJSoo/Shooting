//
//  saveInfo.m
//  Shooting
//
//  Created by JiSoo Kim on 12. 11. 18..
//  Copyright 2012년 __MyCompanyName__. All rights reserved.
//

#import "saveInfo.h"
#define _FILENAME "TOYSHOOTING"

@implementation saveInfo

+(NSString*) GameDataFilePath:(NSString*) fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:fileName];
}
+(void) GameSave{
	saveInfo *save = [[saveInfo alloc]init];
	[save saveGameData];
	
	[save release];
}

+(BOOL)hasSavedGameData{
	NSData *data=[[NSMutableData alloc]initWithContentsOfFile:[self GameDataFilePath:@_FILENAME]];
	
	if(data==nil)
		return NO;
	
	[data release];
	
	return YES;
}
+(void)loadGameData{
	NSData *data=[[NSMutableData alloc]initWithContentsOfFile:[self GameDataFilePath:@_FILENAME]];
	NSKeyedUnarchiver *ke = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
	[ke decodeObjectForKey:@_FILENAME];
	[ke finishDecoding];
	[ke release];
	[data release];
}
+(void)deleteGameDataFile{
	[[NSFileManager defaultManager]removeItemAtPath:[self GameDataFilePath:@_FILENAME] error:NULL];
}
-(void) saveGameData {
    // NSMutableData에 key-value형태로 아카이브한 후 파일에 저장합니다.
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self forKey:@_FILENAME];
    [archiver finishEncoding];
    [data writeToFile:[saveInfo GameDataFilePath:@_FILENAME] atomically:YES];
    [archiver release];
    [data release];
}
#pragma mark NSCoding
- (void) encodeWithCoder:(NSCoder *)encoder {
//	Info *info=[Info sharedInfo];
//	[encoder encodeInt:info.fSec forKey:@"fSec"];
}

- (id) initWithCoder:(NSCoder *)decoder {
	if( (self = [super init]) ) {
//        Info *info=[Info sharedInfo];
//		info.fSec = [decoder decodeIntForKey:@"fSec"];
    }
    return self;
}
@end