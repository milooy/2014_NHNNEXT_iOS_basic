//
//  DetailViewController.m
//  midterm
//
//  Created by Yurim Jin on 2014. 8. 12..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "DetailViewController.h"
#import "MyModel.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(self.detailItem) {
        self.albumTitleLabel.text = [self.detailItem valueForKey:@"title"];
        NSLog(@"kaka: %@", [self.detailItem valueForKey:@"image"]);
        //self.myImage.image = [self.detailItem valueForKey:@"image"];
        self.myImage.image = [UIImage imageNamed:[self.detailItem valueForKey:@"image"]];
        self.dateLabel.text = [self.detailItem valueForKey:@"date"];
        //        self.albumTitleLabel.text = @"haha";
        //        self.dateLabel.text = @"hoho";
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation



@end
