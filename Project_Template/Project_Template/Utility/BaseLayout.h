//
//  BaseLayout.h
//  Forgotcha
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseLayout : NSObject

@property(strong, nonatomic)NSLayoutConstraint *position_Top, *position_Bottom;
@property(strong, nonatomic)NSLayoutConstraint *position_Left, *position_Right;
@property(strong, nonatomic)NSLayoutConstraint *size_Width, *size_Height;
@property(strong, nonatomic)NSLayoutConstraint *position_CenterX, *position_CenterY;

@property(strong, nonatomic)NSArray *control_H, *control_V;
@property(strong, nonatomic)NSDictionary *viewDictionary, *metrics;

-(id)initWithView:(UIView*)iView;
-(void)expandViewInsideView:(UIView*)mainView;
-(void)expandView:(UIView*)containerView insideView:(UIView*)mainView;

@end
