//
//  ViewController.m
//  week4
//
//  Created by Yurim Jin on 2014. 7. 31..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ViewController.h"
#import "myModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *kbp;



@end

@implementation ViewController

- (void) myEventHandler:(NSNotification *) notif {
    NSDictionary *userInfo = [notif userInfo];
    NSNumber *myNum = userInfo[@"myNum"];
    NSLog(@"myNum: %@", myNum);
    
    if([myNum intValue] == 0) {
        [_kbp setImage: [UIImage imageNamed: @"b.jpg"]];
    } else if([myNum intValue] == 1) {
        [_kbp setImage: [UIImage imageNamed: @"k.jpg"]];
    } else {
        [_kbp setImage: [UIImage imageNamed: @"p.jpg"]];
    }
    
    
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

- (void) viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
    [super viewDidAppear:animated];
}

- (void) viewDidDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewDidDisappear:animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) {
        myModel *newMymodel = [[myModel alloc] init];
        [newMymodel randomize];
    }
    [super motionEnded:motion withEvent:event];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self selector:@selector(myEventHandler:) name:@"setRandomNum" object:nil];
    
    
    myModel *newMymodel = [[myModel alloc] init];
    [newMymodel randomize];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"setRandomNum" object:nil];
}

@end
