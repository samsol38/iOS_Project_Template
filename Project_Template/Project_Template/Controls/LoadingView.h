//
//  LoadingView.h
//  GramGetter
//
//  Created by WebMobTech-iMac on 14/04/15.
//  Copyright (c) 2015 Webmob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Constants.h"
#import "InterfaceUtility.h"

#define KContainerViewWidth (IS_IPAD ? 120.0f : 80.0f)
#define KContainerViewHeight (IS_IPAD ? 220.0f : 180.0f)

#define kDialogBackgroundColor [UIColor colorWithRed:113.0f/255.0f green:84.0f/255.0f blue:74.0f/255.0f alpha:1.0f]
#define kDialogFont [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:14.0f]

@interface LoadingView : UIView

-(id)initWithSuperView:(UIView*)iSuperView;

-(void)showLoadingViewWithCompletion:(void (^)(BOOL finished))completion;
-(void)showLoadingViewWithText:(NSString*)labelText andCompletion:(void (^)(BOOL finished))completion;
-(void)hideLoadingViewWithCompletion:(void (^)(BOOL finished))completion;

@end
