//
//  BaseViewController.h
//  Project_Template
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseView;
@class BaseLayout;

@interface BaseViewController : UIViewController

@property(strong, nonatomic)BaseView *aView;
@property(strong, nonatomic)BaseLayout *layout;

-(id)initWithView:(UIView*)iView;
- (id)initWithView:(UIView *)iView andNavigationTitle:(NSString*)titleString;

-(void)loadViewControls;
-(void)setViewControlsLayout;
-(void)expandViewInsideView;

@end
