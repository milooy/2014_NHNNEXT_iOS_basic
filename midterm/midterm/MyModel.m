//
//  MyModel.m
//  midterm
//
//  Created by Yurim Jin on 2014. 8. 12..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

//char형 데이터를 jSON파싱해서 딕셔너리 형태로 mutable array에 넣었다.
-(void)myObserver {
    char *data =
    "[{\"title\":\"초록\",\"image\":\"01.jpg\",\"date\":\"20140116\"},\
    {\"title\":\"장미\",\"image\":\"02.jpg\",\"date\":\"20140505\"},\
    {\"title\":\"낙엽\",\"image\":\"03.jpg\",\"date\":\"20131212\"},\
    {\"title\":\"계단\",\"image\":\"04.jpg\",\"date\":\"20130301\"},\
    {\"title\":\"벽돌\",\"image\":\"05.jpg\",\"date\":\"20140101\"},\
    {\"title\":\"바다\",\"image\":\"06.jpg\",\"date\":\"20130707\"},\
    {\"title\":\"벌레\",\"image\":\"07.jpg\",\"date\":\"20130815\"},\
    {\"title\":\"나무\",\"image\":\"08.jpg\",\"date\":\"20131231\"},\
    {\"title\":\"흑백\",\"image\":\"09.jpg\",\"date\":\"20140102\"}]";
    
    
    NSUInteger size = strlen(data);
    NSData* data2 = [NSData dataWithBytes:(const void *)data length: size];
    
    NSError *error;
    NSMutableArray *jsonInfoArray = [NSJSONSerialization JSONObjectWithData:data2 options:kNilOptions error:&error];
    NSDictionary *jsonInfo = [NSJSONSerialization JSONObjectWithData:data2 options:kNilOptions error:&error];
    _jsonInfo = jsonInfoArray;
     [[NSNotificationCenter defaultCenter] postNotificationName:@"myInit" object:self userInfo:jsonInfo];
}

@end
