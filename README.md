# GHArrayFilter
一套NSArray的过滤Api,底层利用NSPredicate实现    
   
# 基本函数    
- where(keypath) :如果是字符串数组，传nil，否则传model类的属性名  
- query() :最终的执行函数，每次查询结尾必须调用  
  
# 运算  
运算函数中  
可以传基本类型，其结果等同于NSNumber  
可以传char *，const char*,char [],其结果等同于NSString  
- equal(other)  
- no_equal(other)  
- lessThan(other)  
- moreThan(other)  
- lessEqualThan(other)  
- moreEqualThan(other)  
- beginswith(str)  
- endswith(str)  
- contains(obj)  
- like(str)  
- In(array)  
- match(regex)  

# 组合  
后置运算符
- And()  
- Or()  
前置运算符  
- All()  
- Any()  
- Some()  
   
所有运算均为NSPredicate支持的运算，如有不理解，请看NSPredicate文档