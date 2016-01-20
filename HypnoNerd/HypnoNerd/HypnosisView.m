//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Md Mainul Haque on 1/18/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView ()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation HypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor whiteColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    
//    // The circle will be the largest that will fit in the view
//    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    // Add an arc to the path at center, with radius of radius,
    // from 0 to 2*PI radians (a circle)
//    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES
         ];
    }
    
    // Configure line width to 10points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    [self.circleColor setStroke];
    
    [path stroke];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect imageFrame = CGRectMake(center.x - (logoImage.size.width / 2),
                                   center.y - (logoImage.size.height / 2),
                                   logoImage.size.width,
                                   logoImage.size.height);
    [logoImage drawInRect:imageFrame];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (int)sum2:(int)x secondArgument:(int)y {
    return x+y;
}

@end
