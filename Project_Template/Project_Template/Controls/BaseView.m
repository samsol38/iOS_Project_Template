//
//  BaseView.m
//  Project_Template
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import "BaseView.h"
#import "BaseLayout.h"

@interface BaseView(){
    
}

@end

@implementation BaseView

static NSString *KControlResponseKey = @"ControlResponseKey";

#pragma mark - Lifecycle

-(id)init{
    
    self = [super init];
    if(self){
        
    }
    return self;
}

-(void)dealloc{
    
    layout = nil;
    
    errorMessageLabel = nil;
    loadingView = nil;
    
    if(queue != nil){
        [queue cancelAllOperations];
    }
    queue = nil;
}

#pragma mark - Layout

-(void)loadViewControls{
    
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    /*  errorMessageLabel Allocation   */
    
    errorMessageLabel = [[UILabel alloc] init];
    [errorMessageLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [errorMessageLabel setFont:UIFontFromString(@"AppleSDGothicNeo-Medium;15")];
    [errorMessageLabel setNumberOfLines:0];
    [errorMessageLabel setPreferredMaxLayoutWidth:200];
    [errorMessageLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:errorMessageLabel];
    [self displayErrorMessageLabel:nil];

}

-(void)setViewControlsLayout{
    
#if KShowLayOutArea
    [self setBackgroundColor:[UIColor greenColor]];
#endif
    
    layout = [[BaseLayout alloc] init];
    
    layout.viewDictionary = NSDictionaryOfVariableBindings(errorMessageLabel);
    
    /*     errorLabel Layout     */
    
    layout.control_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[errorMessageLabel]|" options:0 metrics:nil views:layout.viewDictionary];
    [self addConstraints:layout.control_H];
    
    layout.position_Top = [NSLayoutConstraint constraintWithItem:errorMessageLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
    
    layout.position_Bottom = [NSLayoutConstraint constraintWithItem:errorMessageLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
    
    [self addConstraints:@[layout.position_Top, layout.position_Bottom]];
    
    layout.control_H = nil;
    layout.position_Top = nil;
    layout.position_Bottom = nil;
    
    layout.viewDictionary = nil;
}

#pragma mark - Public Interface

-(void)displayErrorMessageLabel:(NSString*)errorMessage{
    
    [errorMessageLabel setHidden:YES];
    [errorMessageLabel setText:@""];
    [self sendSubviewToBack:errorMessageLabel];
    
    if(errorMessage != nil){
        [self bringSubviewToFront:errorMessageLabel];
        [errorMessageLabel setHidden:NO];
        [errorMessageLabel setText:errorMessage];
    }
    
    [errorMessageLabel layoutSubviews];
}

+(NSMutableDictionary*)getRequestDictionaryFromView:(UIView*)iView{
    
    id textControl = nil;
    NSString *textFromTextControl = nil;
    NSString *requestKey = nil;
    
    NSMutableDictionary *requestDictionary = [NSMutableDictionary dictionary];
    
    for(UIView *view in [iView subviews]){
        
        if([BaseView isTextControl:view]){
            
            if([BaseView isTextFieldControl:view]){
                
                textControl = (UITextField*)view;
                textFromTextControl = [textControl text];
                
            }else if([BaseView isTextViewControl:view]){
                
                textControl = (UITextView*)view;
                textFromTextControl = [textControl text];
                
            }
            
            requestKey = [view.layer valueForKey:KControlResponseKey];
            if(requestKey != nil && textFromTextControl != nil){
                [requestDictionary setObject:textFromTextControl forKey:requestKey];
            }
        }
    }
    
    textControl = nil;
    textFromTextControl = nil;
    requestKey = nil;
    
    return requestDictionary;
}

+(BOOL)isFirstTextControlInSuperview:(UIView*)superview textControl:(UIView*)textControl{
    
    BOOL isFirstTextControl = true;
    
    NSInteger textControlIndex = -1;
    NSInteger viewControlIndex = -1;
    
    
    if([superview.subviews containsObject:textControl]){
        textControlIndex = [superview.subviews indexOfObject:textControl];
    }
    
    for(UIView *view in superview.subviews){
        
        if([BaseView isTextControl:view] && ![textControl isEqual:view]){
            viewControlIndex = [superview.subviews indexOfObject:view];
            
            if(viewControlIndex < textControlIndex){
                isFirstTextControl = false;
                break;
            }
        }
    }
    return isFirstTextControl;
}

+(BOOL)isLastTextControlInSuperview:(UIView*)superview textControl:(UIView*)textControl{
    
    BOOL isLastTextControl = true;
    
    NSInteger textControlIndex = -1;
    NSInteger viewControlIndex = -1;
    
    
    if([superview.subviews containsObject:textControl]){
        textControlIndex = [superview.subviews indexOfObject:textControl];
    }
    
    for(UIView *view in superview.subviews){
        
        if([BaseView isTextControl:view] && ![textControl isEqual:view]){
            viewControlIndex = [superview.subviews indexOfObject:view];
            
            if(viewControlIndex > textControlIndex){
                isLastTextControl = false;
                break;
            }
        }
    }
    
    return isLastTextControl;
}


+(BOOL)isTextControl:(UIView*)view{
    return ([BaseView isTextFieldControl:view] || [BaseView isTextViewControl:view]);
}

+(BOOL)isTextFieldControl:(UIView*)view{
    return ([view isKindOfClass:[UITextField class]]);
}

+(BOOL)isTextViewControl:(UIView*)view{
    return ([view isKindOfClass:[UITextView class]]);
}


#pragma mark - Internal Helpers

-(void)loadOperationServerRequest{
    
    if(queue == nil){
        queue = [[NSOperationQueue alloc] init];
    }
    [queue cancelAllOperations];
    [self displayErrorMessageLabel:nil];
}

-(void)beginServerRequest{
}


@end