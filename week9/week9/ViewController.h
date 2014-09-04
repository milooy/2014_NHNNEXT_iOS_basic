//
//  ViewController.h
//  week9
//
//  Created by Yurim Jin on 2014. 9. 2..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)firstButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *myfirstButton;

- (IBAction)bookButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *bookButton;

@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
-(NSUInteger)countOfSubstring:(NSString *)substring atContents:(NSString *)contents;

@end
