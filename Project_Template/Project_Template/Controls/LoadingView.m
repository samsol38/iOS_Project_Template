//
//  LoadingView.m
//  Project_Template
//
//  Created by WebMobTech-iMac on 14/04/15.
//  Copyright (c) 2015 Webmob. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView(){
    
    UIView *modelView;
    UIView *containerView;
    
    UIActivityIndicatorView *activityIndicatorView;
    UILabel *loadingMessageLabel;
    
    NSString *labelTextString;
}

-(void)loadView;
-(void)setControlLayOut;

@end

@implementation LoadingView


-(id)initWithSuperView:(UIView*)iSuperView{
    
    self = [super init];
    if(self){
        [iSuperView addSubview:self];
        
        [self loadView];
        [self setControlLayOut];
    }
    
    return self;
}


-(void)loadView{
    
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    /*  Model View Allocation  */
    
    modelView = [[UIView alloc] init];
    [self addSubview:modelView];
    [modelView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [modelView setBackgroundColor:[UIColor blackColor]];
    [modelView setAlpha:0.8f];
    
    /*  container View Allocation  */
    
    containerView = [[UIView alloc] init];
    [self addSubview:containerView];
    [containerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [containerView setBackgroundColor:[UIColor whiteColor]];
    [InterfaceUtility setBorderColor:kDialogBackgroundColor width:0.5f andRadius:6.0f ofView:containerView];
    
    /*  activity IndicatorView Allocation  */
    
    activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicatorView setTintColor:kDialogBackgroundColor];
    [activityIndicatorView setHidesWhenStopped:YES];
    [activityIndicatorView startAnimating];
    [containerView addSubview:activityIndicatorView];
    [activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    /*  loadingMessage Label Allocation  */
    
    loadingMessageLabel = [[UILabel alloc] init];
    [loadingMessageLabel setText:@"Loading..."];
    [loadingMessageLabel setTextAlignment:NSTextAlignmentLeft];
    [loadingMessageLabel setFont:kDialogFont];
    [containerView addSubview:loadingMessageLabel];
    [loadingMessageLabel setTextColor:[UIColor blackColor]];
    [loadingMessageLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self setHidden:YES];
}


-(void)setControlLayOut{
    
#if KHideLayOutArea
    
    [activityIndicatorView setBackgroundColor:[UIColor cyanColor]];
    [loadingMessageLabel setBackgroundColor:[UIColor greenColor]];
    
#endif
    
    NSArray *control_Pos_V, *control_Pos_H;
    NSLayoutConstraint *pos_V, *pos_H, *pos_top, *pos_bottom, *pos_right, *control_height;
    NSDictionary *viewDictionary = @{@"mainView" : self,
                                     @"modelView" : modelView,
                                     @"containerView" : containerView,
                                     @"activityIndicatorView" : activityIndicatorView,
                                     @"loadingMessageLabel" : loadingMessageLabel};
    
    NSDictionary *metrics = @{@"containerViewWidth" : @(KContainerViewWidth),
                              @"containerViewHeight" : @(KContainerViewHeight)};
    
    /*  Main View Layout  */
    
    control_Pos_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[mainView]|"
                                                            options:0
                                                            metrics:nil
                                                              views:viewDictionary];
    control_Pos_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[mainView]|"
                                                            options:0
                                                            metrics:nil
                                                              views:viewDictionary];
    [self.superview addConstraints:control_Pos_V];
    [self.superview addConstraints:control_Pos_H];
    
    /*  Model View Layout  */
    
    control_Pos_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[modelView]|"
                                                            options:0
                                                            metrics:nil
                                                              views:viewDictionary];
    control_Pos_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[modelView]|"
                                                            options:0
                                                            metrics:nil
                                                              views:viewDictionary];
    [self.superview addConstraints:control_Pos_V];
    [self.superview addConstraints:control_Pos_H];
    
    /*  Container View Layout  */
    
    control_Pos_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[containerView(containerViewWidth)]"
                                                            options:0
                                                            metrics:metrics
                                                              views:viewDictionary];
    control_Pos_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[containerView(containerViewHeight)]"
                                                            options:0
                                                            metrics:metrics
                                                              views:viewDictionary];
    [self addConstraints:control_Pos_V];
    [self addConstraints:control_Pos_H];
    
    pos_V = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    pos_H = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    [self addConstraints:@[pos_V, pos_H]];

    
    /*  activity IndicatorView Layout  */
    
    control_Pos_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[activityIndicatorView(30)]"
                                                            options:0
                                                            metrics:nil
                                                              views:viewDictionary];
    control_Pos_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[activityIndicatorView(30)]"
                                                            options:0
                                                            metrics:nil
                                                              views:viewDictionary];
    [containerView addConstraints:control_Pos_V];
    [containerView addConstraints:control_Pos_H];
    
    pos_V = [NSLayoutConstraint constraintWithItem:activityIndicatorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-42.0];
    
    pos_H = [NSLayoutConstraint constraintWithItem:activityIndicatorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    [containerView addConstraints:@[pos_V, pos_H]];
    
    /*  loadingMessage Label Layout  */
    
    control_Pos_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[loadingMessageLabel]"
                                                            options:0
                                                            metrics:nil
                                                              views:viewDictionary];
    [containerView addConstraints:control_Pos_H];
    
    control_height = [NSLayoutConstraint constraintWithItem:loadingMessageLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:activityIndicatorView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    pos_top = [NSLayoutConstraint constraintWithItem:loadingMessageLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:activityIndicatorView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
    pos_bottom = [NSLayoutConstraint constraintWithItem:loadingMessageLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:activityIndicatorView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    pos_right = [NSLayoutConstraint constraintWithItem:loadingMessageLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:activityIndicatorView attribute:NSLayoutAttributeRight multiplier:1.0 constant:7.0];

    [containerView addConstraints:@[control_height, pos_top, pos_bottom, pos_right]];
    
    control_Pos_H = nil;
    control_Pos_V = nil;
    
    pos_top = nil;
    pos_bottom = nil;
    pos_right = nil;
    
    control_height = nil;
    
    viewDictionary = nil;
    metrics = nil;
}

-(void)showLoadingViewWithCompletion:(void (^)(BOOL finished))completion{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [[[AppUtility getAppDelegate] window] setUserInteractionEnabled:NO];
        
        self.hidden = NO;
        [self setAlpha:0.0];
        [UIView animateWithDuration:0.7
                         animations:^{
                             self.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             if(completion != nil){
                                 completion(finished);
                             }
                         }];
    });
}

-(void)showLoadingViewWithText:(NSString*)labelText andCompletion:(void (^)(BOOL finished))completion{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [[[AppUtility getAppDelegate] window] setUserInteractionEnabled:NO];
        
        self.hidden = NO;
        [self setAlpha:0.0];
        [loadingMessageLabel setText:labelText];
        
        [UIView animateWithDuration:0.7
                         animations:^{
                             self.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             if(completion != nil){
                                 completion(finished);
                             }
                         }];
    });
}

-(void)hideLoadingViewWithCompletion:(void (^)(BOOL finished))completion{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [[[AppUtility getAppDelegate] window] setUserInteractionEnabled:YES];
        
        [self setAlpha:1.0];
        [UIView animateWithDuration:1.0
                         animations:^{
                             self.alpha = 0.0;
                         }
                         completion:^(BOOL finished){
                             self.hidden = YES;
                             completion(finished);
                         }];
    });
}

-(void)dealloc{
    
    modelView = nil;
    containerView = nil;
    
    activityIndicatorView = nil;
    loadingMessageLabel = nil;
    
    labelTextString = nil;
}

@end
