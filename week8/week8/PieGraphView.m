//
//  PieGraphView.m
//  week8
//
//  Created by Yurim Jin on 2014. 8. 28..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "PieGraphView.h"

@implementation PieGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    NSLog(@"kaka: %@", _graphArray[0]);
    CGRect bounds = self.bounds;
    CGPoint center = CGPointMake((bounds.size.width/2.0), (bounds.size.height/2.0));
    NSInteger total = [_graphArray count];
    float anglePerMonth = M_PI*2 / total;
    int myNumber = 0;
    CGFloat totalAngle;

    for(int i=0; i<total; i++){
        NSInteger percentage = [_graphArray[i][@"percentage"] integerValue];
//        CGFloat startAngle = anglePerMonth * myNumber;
//        totalAngle +=startAngle;
        CGFloat startAngle = anglePerMonth * myNumber;
//        CGFloat endAngle = totalAngle + 360*percentage/100;
        CGFloat endAngle = startAngle + anglePerMonth;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:self.frame.size.width/2 startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        UIColor *monthColor = [UIColor blueColor];
        UIColor *monthColor2 = [UIColor redColor];
        if(i%2 == 0) {
            [monthColor set];
        } else {
            [monthColor2 set];
        }
        [path fill];
        myNumber++;
        [path addLineToPoint:self.center];
        [path closePath];

    }
 
    
}


@end
