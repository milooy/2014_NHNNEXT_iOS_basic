//
//  MyView.m
//  week8
//
//  Created by Yurim Jin on 2014. 8. 26..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(CGGradientRef)gradient {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    NSArray *gradientColors = @[(id)[UIColor brownColor].CGColor, (id)[UIColor redColor].CGColor];
    CFArrayRef arrayRef = (__bridge CFArrayRef)gradientColors;
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, arrayRef, locations);
    return gradient;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGGradientRef gradient = [self gradient];
    CGPoint startPoint = CGPointMake(CGRectGetMaxX(self.bounds), 0.0);
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds));
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);

    //[[UIColor redColor] setFill];
    //UIRectFill(self.bounds);
}


@end
