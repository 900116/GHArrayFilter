//
//  ViewController.m
//  GHArrayQuerry
//
//  Created by YongCheHui on 2017/3/31.
//  Copyright © 2017年 ApesStudio. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+GHArrayQuerry.h"


@interface GHPerson : NSObject
@property(nonatomic,copy) NSString* name;
@property(nonatomic,assign) int age;
@end
@implementation GHPerson
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GHPerson* zhangsan = [[GHPerson alloc]init];
    zhangsan.name = @"zhangsan";
    zhangsan.age = 12;
    
    GHPerson* lisi = [[GHPerson alloc]init];
    lisi.name = @"lisi";
    lisi.age = 15;
    
    GHPerson* wangwu = [[GHPerson alloc]init];
    wangwu.name = @"wangwu";
    wangwu.age = 22;
    
    GHPerson* wangwu2 = [[GHPerson alloc]init];
    wangwu2.name = @"wangwu";
    wangwu2.age = 15;
    
    GHPerson* wangliu = [[GHPerson alloc]init];
    wangliu.name = @"wangliu";
    wangliu.age = 15;
    
    
    //如果是字符串数组  where传nil  否则传model的keypath
    //equal等运算中：基本类型和NSNumber具有相同的效果
    //              NSString和C_Str具有相同的效果
    
    
    NSArray *array = @[zhangsan,lisi,wangwu,wangwu2,wangliu];
  
    //比较运算符
    //1、equal =
    //2、no_equal !=
    //3、lessThan <
    //4、moreThan >
    //5、lessEqualThan <=
    //6、moreEqualThan >=
    //7、beginswith
    //8、endswith
    //9、contains
    //10、like
    //11、In
    //12、match
    
    //组合运算符
    //1、And  &&
    //2、Or ||
    //3、All
    //4、Any
    //6、Some
    
    //查询
    //query
    
    NSArray* getWangwu = array.where(age).equal(15).And().where(name).equal("wangwu").query();
    NSArray* moreEqualThan = array.where(age).moreEqualThan(15).query();
    NSArray* wangBegin = array.where(name).beginswith("wang").query();
    //字符串数字where传nil
    NSArray* str_arr = @[@"ab",@"abef",@"aab",@"aba",@"bba"];
    //正则表达式
    NSArray* match = str_arr.where(nil).match("a*b").query();
    //包含ab的字符串
    NSArray* likes = str_arr.where(nil).like("*ab*").query();

    NSLog(@"%@",str_arr);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
