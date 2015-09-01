//
//  InterfaceUtility.h
//  Project_Template
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

typedef void (^TableCellDidSelectEvent)(NSInteger cellIndex, id object);
typedef void (^ControlTouchUpInsideEvent)(id sender, id object);

@interface InterfaceUtility : NSObject

extern NSString *const KNoInternetMessage;

+(void)displayAlertViewWithTitle:(NSString*)title andMessage:(NSString*)message;
+(void)displayAlertViewForNoInternetWithTerminateApp:(BOOL)wantTerminateApp;

+(CGSize)getDeviceScreenSize;

+(void)setBorderColor:(UIColor*)borderColor width:(CGFloat)width andRadius:(CGFloat)radius ofView:(UIView*)view;

+(void)setTopBorderColor:(UIColor*)borderColor width:(CGFloat)width ofView:(UIView*)view;
+(void)setBottomBorderColor:(UIColor*)borderColor width:(CGFloat)width ofView:(UIView*)view;
+(void)setLeftBorderColor:(UIColor*)borderColor width:(CGFloat)width ofView:(UIView*)view;
+(void)setRightBorderColor:(UIColor*)borderColor width:(CGFloat)width ofView:(UIView*)view;

+(void)setCircleViewWith:(UIColor*)borderColor width:(CGFloat)width ofView:(UIView*)view;
+(void)setIndicatorAtBottomWithInnerFillColor:(UIColor*)innerFillColor ofView:(UIView*)iView;

+(void)removeIndicatorFromView:(UIView*)iView;

+(UIViewController *)getViewControllerFromSubView:(UIView*)view;

+(CGSize)getAppropriateSizeFromSize:(CGSize)iSize withDivision:(CGFloat)divider andInterSpacing:(CGFloat)interSpacing;

+(CGSize)aspectScaledImageSizeForImageView:(UIImageView *)iv image:(UIImage *)image;
+(UIImage *)cropImage:(UIImage*)image fromRect:(CGRect)rect;
+ (UIImage *)imageFromColor:(UIColor *)color;

+(UIColor *)colorWithHexString:(NSString *)str;
+(UIColor *)colorWithHex:(UInt32)col;

+(CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width;

@end
