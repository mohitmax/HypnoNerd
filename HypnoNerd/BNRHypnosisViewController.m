//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Mohit Sadhu on 4/4/15.
//  Copyright (c) 2015 Mohit Sadhu. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController() <UITextFieldDelegate>

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

//    self.view = self.hypnosisView;
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize Me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    [backgroundView addSubview:textField];
    
    self.view = backgroundView;
    
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (NSInteger i = 0; i < 20; i++)
    {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        //This method resizes the label relative to the text it is displaying.
        [messageLabel sizeToFit];
        
        //Get a random X value taht fits within the hypnosis view's width
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        //Get a random Y value that fits within the hypnosis view's height
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        //Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];
    
    NSLog(@"%@", textField.text);
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

@end
