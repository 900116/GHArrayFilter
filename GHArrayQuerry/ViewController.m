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
    
    NSArray <GHPerson*>*array = @[zhangsan,lisi,wangwu,wangwu2];
    NSArray* next = array.where(age).equal(15).And().where(name).equal("wangwu").query();
    NSLog(@"%@",next);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
