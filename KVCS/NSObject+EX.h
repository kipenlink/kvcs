//
//  NSObject+EX.h
//
//  Copyright (c) 2015年 kipen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (EX)

// KVCS
+(NSMutableArray *)ObjectsForArray:(NSMutableArray *)array;

// KVC
+(id)ObjectsForDict:(NSDictionary *)dic;


@end

