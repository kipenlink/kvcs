//
//  NSObject+EX.m
//
//  Copyright (c) 2015年 kipen. All rights reserved.
//

#import "NSObject+EX.h"
#import <objc/runtime.h>

@implementation NSObject (EX)


+(NSMutableArray *)ObjectsForArray:(NSMutableArray *)array{
    
    
    // 存储所有 KVC之后的集合
    NSMutableArray *ModelList = [NSMutableArray array];
    
    for(int i = 0; i < array.count; i++)
    {
        
        [ModelList addObject:[self ObjectsForDict:array[i]]];
    }

    
    return ModelList;
}

+(id)ObjectsForDict:(NSDictionary *)dic{
    
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    
    id model = [self new];
    for(int i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        
        NSString *pName = [NSString stringWithUTF8String:property_getName(property)];
        
        // 属性
        
        NSString *pAttri = [NSString stringWithUTF8String:property_getAttributes(property)];
        
        NSArray *array = [pAttri componentsSeparatedByString:@"\""];
        
        NSString *tmpP = @"";
        if (array.count>1) {
            
            tmpP =array[1];
            // 属性是对象属性--》
            // 判断是否是系统对象属性
            
            if (![self IsOCBaseType:tmpP]) {
                Class clazz =  NSClassFromString(tmpP);
                
               id obj =  [clazz ObjectsForDict:(NSDictionary *)dic[pName]];
                
                [model setValue:obj forKey:pName];
            }
            
        }
        
        
        if (dic[pName]) {
            
            [model setValue:dic[pName] forKey:pName];
            
        }
    }
      
    
    free(properties);
    
    return model;
}

+(BOOL)IsOCBaseType:(NSString *)strClz{

//   Class clazz =  NSClassFromString(strClz);
    
    
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    dicM[@"NSString"] = @"NSString";
    dicM[@"NSMutableString"] = @"NSMutableString";
//    dicM[@"NSArray"] = @"NSArray";
//    dicM[@"NSMutableArray"] = @"NSMutableArray";
    dicM[@"NSValue"] = @"NSValue";
    dicM[@"NSNumber"] = @"NSNumber";
    dicM[@"NSInteger"] = @"NSInteger";
    dicM[@"CGFloat"] = @"CGFloat";
    
    
    
    return dicM[strClz];
}
@end
