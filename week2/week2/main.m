//
//  main.m
//  week2
//
//  Created by Yurim Jin on 2014. 7. 17..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FromString : NSObject
{
    
}
//- (id) MyJSONSerializationFrom: (NSString*)jsonData;
- (NSString*) MyJSONMakerWithDictionary: (NSDictionary*) dictionary;

@end

@implementation FromString

//- (id) MyJSONSerializationFrom:(NSString *)jsonData {
//
//}

- (NSString *) MyJSONMakerWithDictionary:(NSDictionary*)dictionary {
    NSArray *keysArray = [dictionary allKeys];
    NSUInteger size = [keysArray count];
    NSString *finalJSONString = @"{";
    for(int i=0; i<size; i++) {
        NSString *myValue = dictionary[keysArray[i]];
        NSLog(@"key is %@", keysArray[i]);
        NSLog(@"value is %@", myValue);
        NSString *JSONString = [NSString stringWithFormat:@"%@ : %@ ", keysArray[i], myValue];
        finalJSONString = [finalJSONString stringByAppendingString:JSONString];

    }
    NSLog(@"%@}", finalJSONString);
    return finalJSONString;
}

@end

int main(int argc, const char * argv[])
{
    NSString *myJsonString = @"{\"id\" : \"007\", \"name\" : \"james\", \"weapons\" : \"gun\"}";
    NSDictionary *myDictionary = @{@"yurim" : @"jin", @"hello" : @"world"};

    
    FromString *fromString;
    fromString = [[FromString alloc] init];
    //[fromString MyJSONSerializationFrom:myJsonString];
    [fromString MyJSONMakerWithDictionary:myDictionary];
    
   
    
    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

