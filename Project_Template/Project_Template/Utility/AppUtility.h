//
//  AppUtility.h
//  Project_Template
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtility : NSObject

/*  Network Connection Check    */

+(void)isNetworkAvailableWithBlock:(void (^)(BOOL wasSuccessful))completion;
+(NSString*)getURLStringFromDictionary:(NSDictionary*)dictionary;

/*  User Defaults Methods    */

+(NSString*)getUserDefaultsObjectForKey:(NSString*)key;
+(void)setUserDefaultsObject:(NSString*)value forKey:(NSString*)key;
+(void)clearUserDefaultsForKey:(NSString*)key;
+(void)clearUserDefaults;

/*  Get Device Identifier  */

+(NSString *)getDeviceIdentifier;

/*  Object Misc Methods  */

+(AppDelegate*)getAppDelegate;

/*  Date-Time Methods  */

+(NSString*)getCurrentDateInFormat:(NSString*)format;
+(NSString *)convertStringDateFromFormat:(NSString*)inputFormat toFormat:(NSString*)outputFormat fromString:(NSString*)dateString;
+(NSString*)getTimeStampForCurrentTime;

+(BOOL)isValidEmail:(NSString *)checkString;



@end
