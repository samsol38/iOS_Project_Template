//
//  BaseViewController.m
//  Project_Template
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseLayout.h"

@interface BaseViewController(){
    NSString *navigationTitleString;
}

@end

@implementation BaseViewController

#pragma mark - Lifecycle

- (id)initWithView:(UIView *)iView{
    self = [self initWithView:iView andNavigationTitle:@""];
    
    if(self){
        
    }
    
    return self;
}

- (id)initWithView:(BaseView *)iView andNavigationTitle:(NSString*)titleString{
    self = [super init];
    
    if(self){
        self.aView = iView;
        navigationTitleString = titleString;
        [self showStatusBar];
    }
    
    return self;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.navigationItem setTitle:navigationTitleString];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationItem setTitle:navigationTitleString];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationItem setTitle:@""];
}

- (void)dealloc{
    self.aView = nil;
    navigationTitleString = nil;
    
    self.layout = nil;
}

#pragma mark - Layout

-(void)loadViewControls{
    [self.view addSubview:self.aView];
}

-(void)setViewControlsLayout{
    
#if KHideLayOutArea
    [self.view setBackgroundColor:[UIColor yellowColor]];
#endif
    
    /*  Layout Allocation   */
    
    self.layout = [[BaseLayout alloc] initWithView:self.view];
}

-(void)expandViewInsideView{
    [self.layout expandView:self.aView insideView:self.view];
}


#pragma mark - Public Interface


#pragma mark - User Interaction


#pragma mark - Internal Helpers

-(void)showStatusBar{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        CGRect screen = [[UIScreen mainScreen] bounds];
        if (self.navigationController) {
            CGRect frame = self.navigationController.view.frame;
            frame.origin.y = 20;
            frame.size.height = screen.size.height - 20;
            self.navigationController.view.frame = frame;
        } else {
            if ([self respondsToSelector: @selector(containerView)]) {
                UIView *containerView = (UIView *)[self performSelector: @selector(containerView)];
                
                CGRect frame = containerView.frame;
                frame.origin.y = 20;
                frame.size.height = screen.size.height - 20;
                containerView.frame = frame;
            } else {
                CGRect frame = self.view.frame;
                frame.origin.y = 20;
                frame.size.height = screen.size.height - 20;
                self.view.frame = frame;
            }
        }
    }
}

@end
