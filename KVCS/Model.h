//
//  Model.h
//  KVCS
//
//  Created by kipen on 15/9/13.
//  Copyright (c) 2015年 kipen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Model : NSObject

@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *ids;

@property (nonatomic,strong) Person *person;

@property (nonatomic,assign) CGFloat fl;

@end
