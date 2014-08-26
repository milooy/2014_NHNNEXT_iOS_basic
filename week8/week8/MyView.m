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
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    CGFloat hue2 = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation2 = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness2 = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    UIColor *color2 = [UIColor colorWithHue:hue2 saturation:saturation2 brightness:brightness2 alpha:1];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    NSArray *gradientColors = @[(id)color.CGColor, (id)color2.CGColor];
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
    
    for(int i=0; i<10; i++){
        [self drawPath];
    }
    
    //[[UIColor redColor] setFill];
    //UIRectFill(self.bounds);
}

-(void)drawPath {
    float rand1= arc4random() % 400 + 1;
    float rand2= arc4random() % 400 + 1;
    float rand3= arc4random() % 50 + 1;
    float rand4= arc4random() % 400 + 1;
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint startPointP = CGPointMake(rand1, rand2);
    [path moveToPoint:startPointP];
    CGPoint nextPointP = CGPointMake(rand3, rand4);
    [path addLineToPoint:nextPointP];
    [path setLineWidth:2.0];
    [path stroke];
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    UIBezierPath *Circlepath = [UIBezierPath bezierPath];
    CGPoint center = CGPointMake(rand1, rand2);
    [Circlepath addArcWithCenter:center radius:rand3 startAngle:0.0 endAngle:2.0 * M_PI clockwise:NO];
    [color setFill];
    [Circlepath fill];
}

-(void)Yaho {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint startPointP = CGPointMake(20, 20);
    [path moveToPoint:startPointP];
    CGPoint nextPointP = CGPointMake(30, 30);
    [path addLineToPoint:nextPointP];
    [path setLineWidth:2.0];
    [path stroke];

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touched");
    [self setNeedsDisplay];
}


@end
