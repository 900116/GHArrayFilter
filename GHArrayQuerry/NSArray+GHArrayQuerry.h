//
//  NSArray+GHArrayQuerry.h
//  GHArrayQuerry
//
//  Created by YongCheHui on 2017/3/31.
//  Copyright © 2017年 ApesStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHBaseMacro.h"
#import "ViewController.h"
#define SEL_SINGLE_OBJ_BLK_GET(name) -(NSArray*(^)(id obj))name
#define SEL_VOID_BLK_GET(name)  -(NSArray*(^)())name

@interface NSArray(GHArrayQuerry)
#define PARAM_TO_STR(name) #name
#define where(name) where(PARAM_TO_STR(name))
-(NSArray*(^)(char* keypath))where;
#define equal(...) equal(MASBoxValue((__VA_ARGS__)))
#define no_equal(...) no_equal(MASBoxValue((__VA_ARGS__)))
#define lessThan(...) lessThan(MASBoxValue((__VA_ARGS__)))
#define moreThan(...) moreThan(MASBoxValue((__VA_ARGS__)))
#define lessEqualThan(...) lessEqualThan(MASBoxValue((__VA_ARGS__)))
#define moreEqualThan(...) moreEqualThan(MASBoxValue((__VA_ARGS__)))
#define beginswith(...) beginswith(MASBoxValue((__VA_ARGS__)))
#define endswith(...) endswith(MASBoxValue((__VA_ARGS__)))
#define contains(...) contains(MASBoxValue((__VA_ARGS__)))
#define like(...) like(MASBoxValue((__VA_ARGS__)))
#define match(...) match(MASBoxValue((__VA_ARGS__)))
#define In(...) In(MASBoxValue((__VA_ARGS__)))

SEL_SINGLE_OBJ_BLK_GET(equal);
SEL_SINGLE_OBJ_BLK_GET(no_equal);
SEL_SINGLE_OBJ_BLK_GET(lessThan);
SEL_SINGLE_OBJ_BLK_GET(moreThan);
SEL_SINGLE_OBJ_BLK_GET(lessEqualThan);
SEL_SINGLE_OBJ_BLK_GET(moreEqualThan);
SEL_SINGLE_OBJ_BLK_GET(beginswith);
SEL_SINGLE_OBJ_BLK_GET(endswith);
SEL_SINGLE_OBJ_BLK_GET(contains);
SEL_SINGLE_OBJ_BLK_GET(like);
SEL_SINGLE_OBJ_BLK_GET(match);
SEL_SINGLE_OBJ_BLK_GET(In);
SEL_VOID_BLK_GET(query);
SEL_VOID_BLK_GET(And);
SEL_VOID_BLK_GET(Or);
SEL_VOID_BLK_GET(Some);
SEL_VOID_BLK_GET(Any);
SEL_VOID_BLK_GET(All);
@end
