//
//  BaseView.h
//  Project_Template
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"

@class BaseLayout;

@interface BaseView : UIView{
    
    BaseLayout *layout;
    
    UILabel *errorMessageLabel;
    LoadingView *loadingView;
    
    NSOperationQueue *queue;
}

-(id)init;
-(void)loadViewControls;
-(void)setViewControlsLayout;

-(void)loadOperationServerRequest;
-(void)beginServerRequest;

-(void)displayErrorMessageLabel:(NSString*)errorMessage;
+(NSMutableDictionary*)getRequestDictionaryFromView:(UIView*)iView;

+(BOOL)isFirstTextControlInSuperview:(UIView*)superview textControl:(UIView*)textControl;
+(BOOL)isLastTextControlInSuperview:(UIView*)superview textControl:(UIView*)textControl;

+(BOOL)isTextControl:(UIView*)view;
+(BOOL)isTextFieldControl:(UIView*)view;
+(BOOL)isTextViewControl:(UIView*)view;

@end
