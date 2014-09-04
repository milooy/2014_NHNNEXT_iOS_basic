//
//  ViewController.m
//  week9
//
//  Created by Yurim Jin on 2014. 9. 2..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIColor* rBackground;
@property CGRect rFrame;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _rBackground = _myfirstButton.backgroundColor;
    _rFrame = _myfirstButton.frame;
    
    [self findArrayFromJson];
    
	// Do any additional setup after loading the view, typically from a nib.

}

-(NSUInteger)countOfSubstring:(NSString *)substring atContents:(NSString *)contents {
    dispatch_queue_t bQueue = dispatch_get_main_queue();
    NSRange areaStr;
    areaStr.length = [substring length];
    NSString *firstLetter = [substring substringToIndex:1];
    
    int length = contents.length;
    int wordCount = 0;
    float progress = 0;
    NSString *aString;
    for (int nLoop=0; nLoop<length; nLoop++) {
        NSRange area2; area2.length = 1; area2.location = nLoop;
        aString = [contents substringWithRange:area2];
        //NSLog(@"char: %@ firstLet: %@", aString, firstLetter);
        if ([aString isEqualToString:firstLetter] ){
            areaStr.location = nLoop;
            NSString *word = [contents substringWithRange:areaStr];
            NSLog(@"word: %@", word);
            if ([word isEqualToString:substring]) {
                wordCount++;
            }
        }
        progress = (float)nLoop / (float)length;
        dispatch_async(bQueue, ^{
            _progressBar.progress = progress;
        });
        
    }
    dispatch_async(bQueue, ^{
        [[[UIAlertView alloc] initWithTitle:@"완료"
                                    message:[NSString stringWithFormat:@"찾았다 %d개",wordCount]
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil] show];
    });
    
    return wordCount;
}

-(void)findArrayFromJson {
    NSURL *url = [NSURL URLWithString:@"http://125.209.194.123/wordlist.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *resp = nil;
    NSError *error = nil;
    NSData *data3 = [NSURLConnection sendSynchronousRequest:request returningResponse:&resp error:&error];
    NSMutableArray *jsonInfoArray = [NSJSONSerialization JSONObjectWithData:data3 options:kNilOptions error:&error];
  
    
    NSString *bookfile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]
                                                             pathForResource:@"bookfile" ofType:@".txt"]  encoding:NSUTF8StringEncoding error:nil];
    //for문으로 20개의 어레이를 돌린다. 각각 다른 큐. 그 안에서 다시 돌린다.
    for(int i=0; i<[jsonInfoArray count]; i++) {
        NSString *queueName = @"queue";
        queueName = [NSString stringWithFormat:@"%@%d", queueName, i];
        dispatch_queue_t queue = dispatch_queue_create([queueName UTF8String], 0);
        

        NSString *myWord = jsonInfoArray[i];
        int wordCount = 0;
        for (int nLoop=0; nLoop<[bookfile length]; nLoop++) {
            

            NSRange areaStr;
            areaStr.length = [myWord length]; //단어길이
            NSString *firstLetter = [myWord substringToIndex:1];

            int length = bookfile.length;

            float progress = 0;
            NSString *aString;
            NSRange area2; area2.length = 1; area2.location = nLoop;
            aString = [bookfile substringWithRange:area2];
            //NSLog(@"char: %@ firstLet: %@", aString, firstLetter);
            if ([aString isEqualToString:firstLetter] ){
                areaStr.location = nLoop;
                NSString *word = [bookfile substringWithRange:areaStr];
                //NSLog(@"word: %@", word);
                if ([word isEqualToString:myWord]) {
                    wordCount++;
                }
            }
            progress = (float)nLoop / (float)length;
            dispatch_async(queue, ^{
                _progressBar.progress = progress;
            });
            
            
            
        }
        NSLog(@"word: %@, wordCount: %d", myWord, wordCount);
        dispatch_async(queue, ^{
            [[[UIAlertView alloc] initWithTitle:@"완료"
                                        message:[NSString stringWithFormat:@"%@는 찾았다 %d개 아마도?",myWord, wordCount]
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil] show];
        });
        
    }
    
    
    
    
    

}


-(IBAction)firstButton:(UIButton *)sender{
    NSLog(@"clicked");
    [UIView animateWithDuration:1.0 animations:^(void) {
        _myfirstButton.backgroundColor = [UIColor redColor];
        _myfirstButton.frame = CGRectMake(80, 80, 80, 50);
        _myfirstButton.titleLabel.text = @"clicked";
    } completion:^(BOOL finished) {
        _myfirstButton.backgroundColor = _rBackground;
        _myfirstButton.frame = _rFrame;
    }];

}


-(IBAction)bookButtonClicked:(id)sender {
    _progressBar.progress = 0;
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, ^{
        [self workingProgress];
    });
}

/*
-(void)workingProgress {
    NSString *bookfile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]
                                                             pathForResource:@"bookfile" ofType:@".txt"]  encoding:NSUTF8StringEncoding error:nil];
    dispatch_queue_t bQueue = dispatch_get_main_queue();
    int length = bookfile.length;
    int spaceCount = 0;
    float progress = 0;
    unichar aChar;
    for (int nLoop=0; nLoop<length; nLoop++) {
        aChar = [bookfile characterAtIndex:nLoop];
        if (aChar==' ') spaceCount++;
        progress = (float)nLoop / (float)length;
        dispatch_async(bQueue, ^{
            _progressBar.progress = progress;
        });

    }
    dispatch_async(bQueue, ^{
        [[[UIAlertView alloc] initWithTitle:@"완료"
                                    message:[NSString stringWithFormat:@"찾았다 %d개",spaceCount]
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil] show];
    });
    
}
*/

-(void)workingProgress {
    NSString *bookfile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]
                                                             pathForResource:@"bookfile" ofType:@".txt"]  encoding:NSUTF8StringEncoding error:nil];
    NSString *bookfile2 = @"ab cde fg hijk";
    NSString *bookfile3 = @"가나 다라마 바사 아자차";
    [self countOfSubstring:@"저자" atContents:bookfile];
    //[self countOfSubstring:@"cde" atContents:bookfile2];
    //[self countOfSubstring:@"바사" atContents:bookfile3];

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
