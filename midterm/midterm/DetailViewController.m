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
        self.myImage.image = [UIImage imageNamed:[self.detailItem valueForKey:@"image"]];
        self.dateLabel.text = [self.detailItem valueForKey:@"date"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation
@end
