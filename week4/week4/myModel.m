//
//  myModel.m
//  week4
//
//  Created by Yurim Jin on 2014. 7. 31..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "myModel.h"

@implementation myModel

-(void)randomize {
    NSUInteger randNum = arc4random() %(3);
    NSNumber *myNum = [NSNumber numberWithInteger:randNum];
    
    
    NSDictionary *userInfo = @{@"myNum" : myNum, @"Lettertouch" : @5};

    //NSLog(@"rand: %lu", (unsigned long)randNum);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"setRandomNum" object:self userInfo:userInfo];
}

@end
