//
//  ViewController.m
//  week5
//
//  Created by Yurim Jin on 2014. 8. 7..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myScroll = _myScroll;


- (void)viewDidLoad
{
    [super viewDidLoad];
    for(int i=0; i<22; i++) {
        CGRect imageViewFrame;
        imageViewFrame = CGRectMake(0, 200*i, 350, 200);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
        UIImage *myImage = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg", (i+1)]];
        
        imageView.image = myImage;
        NSLog(@"haha: %@", myImage);
        [self.myScroll addSubview:imageView];
        
    }
    [_myScroll setContentSize:CGSizeMake(350, 200*22)];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
