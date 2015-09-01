//
//  MainViewController.m
//  Project_Template
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController(){
    MainView *mainView;
}

@end

@implementation MainViewController

#pragma mark - Lifecycle

- (id)init{
    
    MainView *subView = [[MainView alloc] init];
    self = [super initWithView:subView andNavigationTitle:@"MainView"];
    
    if(self){
        mainView = subView;
        [self loadViewControls];
        [self setViewControlsLayout];
        subView = nil;
    }
    
    return self;
}

- (void)dealloc{
    mainView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Layout

-(void)loadViewControls{
    [super loadViewControls];
    
}

-(void)setViewControlsLayout{
    [super setViewControlsLayout];
    [super expandViewInsideView];
}

#pragma mark - Public Interface


#pragma mark - User Interaction


#pragma mark - Internal Helpers

@end
