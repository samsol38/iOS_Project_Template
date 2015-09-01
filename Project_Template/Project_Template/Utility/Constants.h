//
//  Constants.h
//  Project_Template
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

/*  System Oriented Constants   */

#define KShowLayOutArea 1
#define KHideLayOutArea 0
#define KShowVersionNumber 1

/*****************************/
/*   Useful Macro Function   */
/*****************************/

/*  Disable Log Message in Release version but not in Debug version  */

#ifdef DEBUG
#   define NSLog(...) NSLog(__VA_ARGS__)
#else
#   define NSLog(...)
#endif

/*  Check that device is iPad or not  */

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/*  Check that System Version is v version or later  */

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

/*  Append two Strings  */

#define AppendString(string1, string2) [NSString stringWithFormat:@"%@%@", string1, string2]

/*  Convert HTML Color Code to UIColor Ex. :0xCECECE    */

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/*  Convert HTML Color Code with Alpha Value to UIColor Ex. :0xCECECE and Alpha Value Ex.:0.4   */

#define UIColorFromRGBWithAlpha(rgbValue, a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

/*  Get UIFont object from Font name and size   */

#define UIFontFromNameAndSize(_name_, _size_) ((UIFont *)[UIFont fontWithName:(NSString *)(_name_) size:(CGFloat)(_size_)])

/*  Get UIFont object from Font name and size seperated by ';'  Ex. : UIFontFromString(@"Arial;10.0f")  */

#define UIFontFromString(fontString) ((UIFont *)[UIFont fontWithName:[fontString componentsSeparatedByString:@";"][0] size:[[fontString componentsSeparatedByString:@";"][1] floatValue]])

/**************************/
/*    Comman Constants    */
/**************************/



@end
