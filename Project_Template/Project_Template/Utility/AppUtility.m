//
//  AppUtility.m
//  Forgotcha
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import "AppUtility.h"

static dispatch_queue_t networkQueue;

static Reachability* reach;

@implementation AppUtility

#pragma mark - Network Connection Check Methods

+(void)isNetworkAvailableWithBlock:(void (^)(BOOL wasSuccessful))completion{
    
    static dispatch_once_t queueCreationGuard;
    
    dispatch_once(&queueCreationGuard, ^{
        networkQueue = dispatch_queue_create("NetworkQueue", NULL);
    });
    
    __block Reachability* blockReach = reach;
    
    dispatch_async(networkQueue, ^{
        blockReach = [Reachability reachabilityWithHostname:@"www.google.com"];
        blockReach.reachableBlock = ^(Reachability *iReach){
            [iReach stopNotifier];
            completion(true);
        };
        
        blockReach.unreachableBlock = ^(Reachability *iReach){
            [iReach stopNotifier];
            completion(false);
        };
        [blockReach startNotifier];
    });
}

+(NSString*)getURLStringFromDictionary:(NSDictionary*)dictionary{
    
    NSMutableString *urlStringWithDetails = [NSMutableString stringWithString:@""];
    NSInteger count = [[dictionary allKeys]count];
    
    for(NSString *string in [dictionary allKeys]){
        
        if([[dictionary allKeys] indexOfObject:string] < count-1){
            [urlStringWithDetails appendFormat:@"%@=%@&", string, dictionary[string]];
        }else{
            [urlStringWithDetails appendFormat:@"%@=%@", string, dictionary[string]];
        }
    }
    
    NSString *finalString = [NSString stringWithString:urlStringWithDetails];
    urlStringWithDetails = nil;
    
    return finalString;
}

#pragma mark - User Defaults Methods

+(NSObject*)getUserDefaultsObjectForKey:(NSString*)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(void)setUserDefaultsObject:(NSObject*)object forKey:(NSString*)key{
    [[NSUserDefaults standardUserDefaults] setValue:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)clearUserDefaultsForKey:(NSString*)key{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)clearUserDefaults{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


#pragma mark - UIDevice Methods

+(NSString *)getDeviceIdentifier{
    
    NSString *deviceUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"Device ID: %@", deviceUUID);
    
    return deviceUUID;
}

#pragma mark - Misc Methods

+(AppDelegate*)getAppDelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}


#pragma mark - Time-Date Methods

+(NSString*)getCurrentDateInFormat:(NSString*)format{
    
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat: format];
    [timeFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [timeFormatter setLocale:usLocale];
    
    NSDate *date = [NSDate date];
    NSString *stringFromDate = [timeFormatter stringFromDate:date];
    
    usLocale = nil;
    timeFormatter = nil;
    
    return stringFromDate;
}

+(NSString *)convertStringDateFromFormat:(NSString*)inputFormat toFormat:(NSString*)outputFormat fromString:(NSString*)dateString{
    
    NSDateFormatter *dateFormatter = nil;
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateFormat:inputFormat];
    NSDate * date = [dateFormatter dateFromString:dateString];
    dateFormatter = nil;
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateFormat:outputFormat];
    NSString *resultedDateString = [dateFormatter stringFromDate:date];
    dateFormatter = nil;
    date = nil;
    
    return resultedDateString;
}

+(NSString*)getTimeStampForCurrentTime{
    NSString *timestamp = [[NSNumber numberWithLongLong:[[NSDate date] timeIntervalSince1970] * 1000] stringValue];
    return timestamp;
}

+(BOOL)isValidEmail:(NSString *)checkString{
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}


@end
