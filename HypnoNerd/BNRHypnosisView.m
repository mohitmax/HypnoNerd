//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Mohit Sadhu on 12/21/14.
//  Copyright (c) 2014 MohitSadhu. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView() 

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor blueColor];
        
        [self updateSegmentedControl];
    }
    return self;
}


- (void)updateSegmentedControl
{
    self.segControl = [[UISegmentedControl alloc] initWithItems:@[@"Red", @"Green", @"Blue"]];
    self.segControl.frame = CGRectMake(50, 20, 300, 30);
    self.segControl.backgroundColor = [UIColor whiteColor];
    
    [self.segControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:self.segControl];
}

- (void)valueChanged: (UISegmentedControl *)segment
{
    NSLog(@"segment index: %lu", segment.selectedSegmentIndex);
    if (segment.selectedSegmentIndex == 0)
    {
        self.circleColor = [UIColor redColor];
    }
    else if (segment.selectedSegmentIndex == 1)
    {
        self.circleColor = [UIColor greenColor];
    }
    else if (segment.selectedSegmentIndex == 2)
    {
        self.circleColor = [UIColor blueColor];
    }
}


- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    NSLog(@"circle color: %@", _circleColor);
    [self setNeedsDisplayInRect:self.bounds];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ view touched",[self class]);
    
    float red = (arc4random() % 255) / 255.0;
    float green = (arc4random() % 255) / 255.0;
    float blue = (arc4random() % 255) / 255.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    NSLog(@"random color: %@", randomColor);
    self.circleColor = randomColor;
    
    
}


- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
//    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }


    
//    [[UIColor lightGrayColor] setStroke];
    [self.circleColor setStroke];
    
    path.lineWidth = 10.0f;
    [path stroke];
    
    UIImage *image = [UIImage imageNamed:@"logo.png"];
    [image drawInRect:CGRectMake(50, 50, 200, 300)];
}

@end

