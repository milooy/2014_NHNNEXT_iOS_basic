//
//  main.m
//  week1
//
//  Created by Yurim Jin on 2014. 7. 10..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

void displayAllFilesAtPath(NSString* path) {
    BOOL flag = NO;
    
    NSFileManager *FileManager;
    FileManager = [NSFileManager defaultManager]; //파일매니저의 인스턴스 생성
    
    NSDirectoryEnumerator *enumerator = [FileManager enumeratorAtPath:path]; // 디렉토리 열거자 생성
    NSString *myFile;
    // nextObject 이용 파일이름을 불러옴
    while( (myFile = [enumerator nextObject]) != nil ){
        // idDirectory의 인자로 BOOL 변수 포인터를 지정, 폴더인지 파일인지 판단
        
        if( [FileManager fileExistsAtPath:      // fileExistsAtPath 이용, 파일이 존재하는지 확인
             [path stringByAppendingPathComponent:myFile] isDirectory:&flag] ){
            NSLog(@"haha: %@", myFile);//pdf 내부의 사진까지 다 읽어오네 헐... 어케한걸까
        }
    }
}

void findFile(NSString* path, NSString *fileName) {
    BOOL flag = NO;
    
    NSFileManager *FileManager;
    FileManager = [NSFileManager defaultManager]; //파일매니저의 인스턴스 생성
    
    NSDirectoryEnumerator *enumerator = [FileManager enumeratorAtPath:path]; // 디렉토리 열거자 생성
    NSString *myFile;
    // nextObject 이용 파일이름을 불러옴
    while( (myFile = [enumerator nextObject]) != nil ){
        // idDirectory의 인자로 BOOL 변수 포인터를 지정, 폴더인지 파일인지 판단
        if( [FileManager fileExistsAtPath:      // fileExistsAtPath 이용, 파일이 존재하는지 확인
             [path stringByAppendingPathComponent:myFile] isDirectory:&flag] ){
            if([myFile isEqual:fileName]) {
                NSLog(@"I FOUND: %@", myFile); //파일 찾으면 나옴.
            }
        }
    }
}


int main(int argc, const char * argv[])
{
    NSString *fileName = @"food-todo-기획서.pdf";
    NSString *pathName = @"/Users/yurim/Documents/food-todo";
    displayAllFilesAtPath(pathName);
    findFile(pathName, fileName);
    @autoreleasepool {
    }
    return 0;
}

