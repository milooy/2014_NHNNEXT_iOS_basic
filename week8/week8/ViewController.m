//
//  ViewController.m
//  week8
//
//  Created by Yurim Jin on 2014. 8. 26..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSError *error;
    NSString *graphString = @"[{\"title\":\"April\", \"value\":5},{\"title\":\"May\", \"value\":12},{\"title\":\"June\", \"value\":18},{\"title\":\"July\", \"value\":11},{\"title\":\"August\", \"value\":15},{\"title\":\"September\", \"value\":9},{\"title\":\"October\", \"value\":17},{\"title\":\"November\", \"value\":25},{\"title\":\"December\", \"value\":31}]";
    NSData* graphData = [graphString dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *graphArray = [NSJSONSerialization JSONObjectWithData:graphData options:kNilOptions error:&error];
    _myBarGraphView.graphArray = graphArray;
    
    //Pie;
    NSString *graphString2 = @"[{\"title\":\"April\", \"percentage\":18},{\"title\":\"May\", \"percentage\":12},{\"title\":\"June\", \"percentage\":18},{\"title\":\"July\", \"percentage\":13},{\"title\":\"August\", \"percentage\":18}, {\"title\":\"September\", \"percentage\":9},{\"title\":\"October\", \"percentage\":18}]";
    NSData* graphData2 = [graphString2 dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *graphArray2 = [NSJSONSerialization JSONObjectWithData:graphData2 options:kNilOptions error:&error];
    _myPieGraphView.graphArray = graphArray2;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
