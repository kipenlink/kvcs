//
//  ViewController.m
//  KVCS
//
//  Created by kipen on 15/9/13.
//  Copyright (c) 2015年 kipen. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "NSObject+EX.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    
    NSDictionary *dit = @{@"ids":@"ids1",@"text":@"text1",@"person":@{@"pe1":@"pe111",@"pe2":@"pe22222"}};
    NSMutableArray *arrM = @[dit,dit,dit,dit].mutableCopy;

//    NSDictionary *dict2 = @{@"ids":@"111",@"fl":@"s"};
    
//    Model *model = [Model ObjectsForDict:dict2];
    
   NSArray *arr = [Model ObjectsForArray:arrM];
    
    NSLog(@"model%@",arr);
}



@end
