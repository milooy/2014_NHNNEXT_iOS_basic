//
//  ViewController.h
//  week8
//
//  Created by Yurim Jin on 2014. 8. 26..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarGraphView.h"
#import "PieGraphView.h"

@interface ViewController : UIViewController
//@property NSMutableArray* graphArray;
@property (weak, nonatomic) IBOutlet BarGraphView *myBarGraphView;
@property (weak, nonatomic) IBOutlet PieGraphView *myPieGraphView;
@end
