//
//  NSArray+GHArrayQuerry.m
//  GHArrayQuerry
//
//  Created by YongCheHui on 2017/3/31.
//  Copyright © 2017年 ApesStudio. All rights reserved.
//

#import "NSArray+GHArrayQuerry.h"
#import <objc/runtime.h>
#import "GHBaseMacro.h"
#define IMP_SINGLE_OBJ_GET(name,block) \
-(NSArray*(^)(id obj))name \
{ \
    return block; \
}\

#define IMP_VOID_OBJ_GET(name,block) \
-(NSArray*(^)())name \
{ \
return block; \
}\

@implementation NSArray(GHArrayQuerry)
static char * const gh_conditionKey = "gh_conditionKey";
-(NSMutableString *)conditionString
{
    [self createConditionKeyIfNoHave];
    return  objc_getAssociatedObject(self, gh_conditionKey);
}

-(void)resetConditionKey
{
    objc_setAssociatedObject(self, gh_conditionKey, [NSMutableString new],  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)createConditionKeyIfNoHave
{
    id obj = objc_getAssociatedObject(self, gh_conditionKey);
    if (!obj) {
        [self resetConditionKey];
    }
}

-(NSArray*(^)(char* keypath))where
{
    return ^(char* keypath){
        NSMutableString *conditionStrg = [self conditionString];
        if (strcmp(keypath, "((void *)0)") == 0) {
            [conditionStrg appendString:@"SELF "];
        }
        else
        {
             [conditionStrg appendFormat:@"SELF.%s ",keypath];
        }
        return self;
    };
}

#define IMP_SINGLE_OBJ_GET_OPERATION(name,op) \
IMP_SINGLE_OBJ_GET(name, (^(id value){ \
    NSMutableString *conditionStrg = [self conditionString]; \
        if([value isKindOfClass:[NSString class]]) \
     { \
        [conditionStrg appendFormat:@"%@ '%@'",op,value]; \
     }\
    else if([value isKindOfClass:[NSNumber class]]) \
    { \
        [conditionStrg appendFormat:@"%@ %@",op,value]; \
    }\
    return self; \
}))\

IMP_SINGLE_OBJ_GET_OPERATION(equal, @"=");
IMP_SINGLE_OBJ_GET_OPERATION(no_equal, @"!=");
IMP_SINGLE_OBJ_GET_OPERATION(lessThan,@"<");
IMP_SINGLE_OBJ_GET_OPERATION(lessEqualThan, @"<=");
IMP_SINGLE_OBJ_GET_OPERATION(moreThan, @">");
IMP_SINGLE_OBJ_GET_OPERATION(moreEqualThan, @">=");
IMP_SINGLE_OBJ_GET_OPERATION(beginswith, @"BEGINSWITH");
IMP_SINGLE_OBJ_GET_OPERATION(endswith, @"ENDSWITH");
IMP_SINGLE_OBJ_GET_OPERATION(contains, @"CONTAINS");
IMP_SINGLE_OBJ_GET_OPERATION(like, @"LIKE");
IMP_SINGLE_OBJ_GET_OPERATION(match, @"MATCHES");
IMP_SINGLE_OBJ_GET_OPERATION(In, @"IN");
IMP_VOID_OBJ_GET(query, (^{
    NSMutableString *conditionStrg = [self conditionString];
    [self resetConditionKey];
    if(conditionStrg.length == 0){
        return self;
    }
    else
    {
        NSLog(@"%@",conditionStrg);
        NSPredicate* predicate = [NSPredicate predicateWithFormat:conditionStrg];
        return [self filteredArrayUsingPredicate:predicate];
    }
}));

#define IMP_VOID_OBJ_GET_OPERATION(name, op) \
IMP_VOID_OBJ_GET(name, (^{ \
    NSMutableString *conditionStrg = [self conditionString]; \
    [conditionStrg appendFormat:@" %@ ",op]; \
    return self; \
}));

IMP_VOID_OBJ_GET_OPERATION(And, @"&&");
IMP_VOID_OBJ_GET_OPERATION(Or, @"||");
IMP_VOID_OBJ_GET_OPERATION(Some, @"SOME");
IMP_VOID_OBJ_GET_OPERATION(Any, @"ANY");
IMP_VOID_OBJ_GET_OPERATION(All, @"ALL");
@end
