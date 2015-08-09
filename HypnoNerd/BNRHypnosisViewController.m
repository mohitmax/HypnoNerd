//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Mohit Sadhu on 4/4/15.
//  Copyright (c) 2015 Mohit Sadhu. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController()

@property (strong, nonatomic) BNRHypnosisView *hypnosisView;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;

@end

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        self.tabBarItem.title = @"Hypnotize";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno.png"];
        
        self.hypnosisView = [[BNRHypnosisView alloc] init];
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
//    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
//    self.view = backgroundView;
    
    self.view = self.hypnosisView;
    
//    self.segmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(20, 100, 300, 30)];
//    self.segmentedControl.backgroundColor = [UIColor grayColor];
//    
//    [self.segmentedControl insertSegmentWithTitle:@"Red" atIndex:0 animated:YES];
//    [self.segmentedControl insertSegmentWithTitle:@"Green" atIndex:0 animated:YES];
//    [self.segmentedControl insertSegmentWithTitle:@"Blue" atIndex:0 animated:YES];
//    
//    [self.hypnosisView addSubview:self.segmentedControl];
}

@end
