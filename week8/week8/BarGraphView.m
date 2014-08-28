//
//  BarGraphView.m
//  week8
//
//  Created by Yurim Jin on 2014. 8. 28..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "BarGraphView.h"
#import "ViewController.h"

@implementation BarGraphView

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
    // Drawing code
    NSLog(@"haha: %@", _graphArray[0][@"value"]);
    
    for(int i=0; i<4; i++) {
        NSNumber *value =  _graphArray[i][@"value"];
        [self drawPath:value int:i title:_graphArray[i][@"title"]];
    }
    


}

-(void)drawPath: (NSNumber*)val int:(NSInteger)i title:(NSString *)title{
    //막대그래프
    NSInteger padding = 40;
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint startPointP = CGPointMake(30, padding*(i+1));
    [path moveToPoint:startPointP];
    CGPoint nextPointP = CGPointMake(30+[val integerValue]*10, padding*(i+1));
    [path addLineToPoint:nextPointP];
    [path setLineWidth:20.0];
    [[UIColor blueColor] setStroke];
    [path stroke];
    NSLog(@"val: %@ int: %ld", val, (long)i);
    
    //글자
    UIFont *font = [UIFont fontWithName: @"Courier" size: 14];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys: font, NSFontAttributeName, nil];
    NSString* firstString = title;
    [firstString drawInRect:CGRectMake(1,padding*(i+1),100,12) withAttributes:dictionary];
    
}


@end
