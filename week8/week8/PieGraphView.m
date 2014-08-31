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
    //원
    NSLog(@"kaka: %@", _graphArray[0]);
    CGRect bounds = self.bounds;
    CGPoint center = CGPointMake((bounds.size.width/2.0), (bounds.size.height/2.0));
    NSInteger total = [_graphArray count];
    int myNumber = 0;
    CGFloat totalAngle =0;

    
    for(int i=0; i<total; i++){
        NSNumber *percent = _graphArray[i][@"percentage"];
        CGFloat degree = [percent floatValue]*360/100;
        CGFloat startAngle = totalAngle;
        CGFloat endAngle = totalAngle + degree*M_PI/180;
        totalAngle = endAngle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:self.frame.size.width/2 startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        if(i%4 == 0) {
            [[UIColor blueColor] set];
        } else if(i%4 == 1) {
            [[UIColor redColor] set];
        } else if(i%4 == 2) {
            [[UIColor greenColor] set];
        } else {
            [[UIColor grayColor] set];
        }
        myNumber++;
        [path addLineToPoint:center];
        [path fill];
        [path closePath];
        NSLog(@"count: %d percent: %@ %f~%f", i, percent, startAngle, endAngle);
        
    }
}


@end
