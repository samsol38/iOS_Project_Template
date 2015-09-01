//
//  BaseNavigationController.m
//  Forgotcha
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController(){
    
}

-(void)setDefaultParameters;

@end

@implementation BaseNavigationController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDefaultParameters];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public Interface


#pragma mark - User Interaction


#pragma mark - Internal Helpers

-(void)setDefaultParameters{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationBar setTranslucent:NO];
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    UIFont *navigationBarFont = UIFontFromString(@"AppleSDGothicNeo-Medium;17");
    
    NSDictionary *navigationAttributeDictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: navigationBarFont, nil]
                                                                              forKeys:[NSArray arrayWithObjects: NSFontAttributeName, nil]];
    [[UINavigationBar appearance] setTitleTextAttributes:navigationAttributeDictionary];
    
    /*
     
     UIColor *backgroundColor = [UIColor whiteColor];
     NSDictionary *navigationAttributeDictionary = [NSDictionary dictionaryWithObjects:@[backgroundColor]
     forKeys:@[NSBackgroundColorAttributeName]];
     [[UINavigationBar appearanceWhenContainedIn:[MFMailComposeViewController class], nil] setTitleTextAttributes:textAttributeDictionary];
     
     */
    
    [self.navigationBar setTintColor:UIColorFromRGB(0x000000)];
    [self.navigationBar setTranslucent:NO];
}

@end
