//
//  DetailViewController.h
//  midterm
//
//  Created by Yurim Jin on 2014. 8. 12..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ViewController.h"
@class MyModel;

@interface DetailViewController : ViewController
@property (strong, nonatomic) NSDictionary *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *albumTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;


@end
