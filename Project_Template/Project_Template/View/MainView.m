//
//  MainView.m
//  Project_Template
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import "MainView.h"

@interface MainView(){
    
}

@end

@implementation MainView

#pragma mark - Lifecycle

- (id)init{
    self = [super init];
    
    if(self){
        [self loadViewControls];
        [self setViewControlsLayout];
    }
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

- (void)dealloc{
    
    
}

#pragma mark - Layout

-(void)loadViewControls{
    [super loadViewControls];
    
}

- (void)setViewControlsLayout{
    [super setViewControlsLayout];
    
#if KHideLayOutArea
    
#endif
    
    
}

#pragma mark - Public Interface


#pragma mark - User Interaction


#pragma mark - Internal Helpers



@end
