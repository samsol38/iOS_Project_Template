//
//  BaseLayout.m
//  Forgotcha
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import "BaseLayout.h"

@interface BaseLayout(){
    UIView *view;
}

@end

@implementation BaseLayout

#pragma mark - Lifecycle

-(id)initWithView:(UIView*)iView{
    self = [super init];
    if(self){
        view = iView;
    }
    return self;
}

-(void)dealloc{
    view = nil;
    
    self.position_Top = nil;
    self.position_Bottom = nil;
    
    self.position_Left = nil;
    self.position_Right = nil;
    
    self.size_Width = nil;
    self.size_Height = nil;
    
    self.position_CenterX = nil;
    self.position_CenterY = nil;
    
    self.control_H = nil;
    self.control_V = nil;
    
    self.viewDictionary = nil;
    self.metrics = nil;
}

-(void)expandViewInsideView:(UIView*)mainView{
    
    NSDictionary *dictionary = NSDictionaryOfVariableBindings(view);
    
    self.control_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:dictionary];
    self.control_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:dictionary];
    
    [mainView addConstraints:self.control_H];
    [mainView addConstraints:self.control_V];
    
    self.control_H = nil;
    self.control_V = nil;
    
    dictionary = nil;
}

-(void)expandView:(UIView*)containerView insideView:(UIView*)mainView{
    
    NSDictionary *dictionary = NSDictionaryOfVariableBindings(containerView);
    
    self.control_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[containerView]|" options:0 metrics:nil views:dictionary];
    self.control_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[containerView]|" options:0 metrics:nil views:dictionary];
    
    [mainView addConstraints:self.control_H];
    [mainView addConstraints:self.control_V];
    
    self.control_H = nil;
    self.control_V = nil;
    
    dictionary = nil;
}


@end
