//
//  ViewController.m
//  NSPredicateDemo
//
//  Created by Helios on 2019/8/17.
//  Copyright © 2019 Helios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark - 1.比较运算符
    
    // =、 == 表示相等
    // >=，=> 大于或等于
    // <=，=< 小于或等于
    // >  大于
    // <  小于
    // != 、 <>  >：判断两个表达式
    
    NSNumber *testNum = @123;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF = 123"]; //SELF = 123
    if([predicate evaluateWithObject:testNum]){
        NSLog(@"是相等的");
    }else{
        NSLog(@"不相等");
    }
    
#pragma mark - 2.逻辑运算符
    
    // AND、&&  逻辑与
    // OR、||   逻辑或
    // NOT、 !  逻辑非
    
//    NSArray *testArr = @[@1,@2,@3,@4,@5,@6];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF > 2 && SELF < 5"];
//
//    NSArray *filterArr = [testArr filteredArrayUsingPredicate:predicate]; //过滤
//    NSLog(@"filterArr : %@",filterArr);
    
#pragma mark - 3.字符串比较运算符
    /*
     BEGINSWITH:检查某个字符串是否以指定的字符串开头（如判断字符串是否以a开头：BEGINSWITH 'a'）
           e.g :NSPredicate *pre = [NSPredicate predicateWithFormat:@"name BEGINSWITH s"];
     
    ENDSWITH：检查某个字符串是否以指定的字符串结尾
    CONTAINS：检查某个字符串是否包含指定的字符串
    LIKE：检查某个字符串是否匹配指定的字符串模板。其之后可以跟?代表一个字符和*代表任意多个字符两个通配符。
          比如"name LIKE '*ac*'"，这表示name的值中包含ac则返回YES；"name LIKE '?ac*'"，
          表示name的第2、3个字符为ac时返回YES。
    MATCHES：检查某个字符串是否匹配指定的正则表达式。
     */
    
#pragma mark - 4.集合运算符
    //ANY、SOME：集合中任意一个元素满足条件，就返回YES。
    //ALL：集合中所有元素都满足条件，才返回YES。
    //NONE：集合中没有任何元素满足条件就返回YES。如:NONE person.age < 18，表示person集合中所有元素的age>=18时，才返回YES。
    //IN：等价于SQL语句中的IN运算符，只有当左边表达式或值出现在右边的集合中才会返回YES。我们通过一个例子来看一下
    // 代码的作用是将array中和filterArray中相同的元素去除
    
//    NSArray *filterArray = @[@"ab", @"abc"];
//    NSArray *array = @[@"a", @"ab", @"abc", @"abcd"];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)", filterArray];
//    NSArray *newArr = [array filteredArrayUsingPredicate:predicate];
//    NSLog(@"%@", newArr);
    
//    array[index]：返回array数组中index索引处的元素
//    array[FIRST]：返回array数组中第一个元素
//    array[LAST]：返回array数组中最后一个元素
//    array[SIZE]：返回array数组中元素的个数
    
#pragma mark - 5.直接量
    
    /*在谓词表达式中可以使用如下直接量
    
    FALSE、NO：代表逻辑假
    TRUE、YES：代表逻辑真
    NULL、NIL：代表空值
    SELF：代表正在被判断的对象自身
    "string"或'string'：代表字符串
    数组：和c中的写法相同，如：{'one', 'two', 'three'}。
    数值：包括证书、小数和科学计数法表示的形式
    十六进制数：0x开头的数字
    八进制：0o开头的数字
    二进制：0b开头的数字*/
    
#pragma mark - 6.保留字
    /*下列单词都是保留字（不论大小写）
    AND、OR、IN、NOT、ALL、ANY、SOME、NONE、LIKE、CASEINSENSITIVE、CI、MATCHES、CONTAINS、BEGINSWITH、ENDSWITH、BETWEEN、NULL、NIL、SELF、TRUE、YES、FALSE、NO、FIRST、LAST、SIZE、ANYKEY、SUBQUERY、CAST、TRUEPREDICATE、FALSEPREDICATE*/
    
    
#pragma mark - 7.使用谓词过滤集合(重点)
    /*
     其实谓词本身就代表了一个逻辑条件，计算谓词之后返回的结果永远为BOOL类型的值。而谓词最常用的功能就是对集合进行过滤。当程序使用谓词对集合元素进行过滤时，程序会自动遍历其元素，并根据集合元素来计算谓词的值，当这个集合中的元素计算谓词并返回YES时，这个元素才会被保留下来。请注意程序会自动遍历其元素，它会将自动遍历过之后返回为YES的值重新组合成一个集合返回。
     */
    
    /*
     NSArray 提供了如下方法使用谓词来过滤集合: (会返回符合条件的集合元素组成的 新集合)
     - (NSArray<ObjectType> *)filteredArrayUsingPredicate:(NSPredicate*)predicate
     */
    
    /*
     NSMutableArray 提供了如下方法使用谓词来过滤集合:(没有返回值，会 直接剔除 不符合条件的集合元素)
     - (void)filterUsingPredicate:(NSPredicate *)predicate
     */
    
    /*
     NSSet 提供了如下方法使用谓词来过滤集合: (会返回符合条件的集合元素组成的 新集合)
     - (NSSet<ObjectType> *)filteredSetUsingPredicate:(NSPredicate *)predicate
     */
    
    /*
     NSMutableSet 提供了如下方法使用谓词来过滤集合: (没有返回值，会 直接剔除 不符合条件的集合元素)
     - (void)filterUsingPredicate:(NSPredicate *)predicate
     */
    
    //例子：
    //不可变数组的过滤：
//    NSArray *arrayN = @[@20, @40, @50, @30, @60, @70];
//    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF > 50"];
//    NSArray *newArr = [arrayN filteredArrayUsingPredicate:pred2];
//    NSLog(@"arrayN:%@", newArr);
    
    //可变数组的过滤：
//    NSMutableArray *arrayM = [@[@20, @40, @50, @30, @60, @70] mutableCopy];
//    NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF > 50"];
//    [arrayM filterUsingPredicate:pred1];
//    NSLog(@"arrayM:%@", arrayM);
    /*注意：使用谓词过滤不可变集合和可变集合的区别是：
     过滤不可变集合时，会返回符合条件的集合元素组成的新集合；
     过滤可变集合时，没有返回值，会直接剔除不符合条件的集合元素*/
    
    
#pragma mark - 8.过滤自定义对象
    //  要求取出包含‘son’的元素
//    NSArray *array = @[[ZLPersonModel personWithName:@"Jack" age:20 sex:ZLPersonSexMale],
//                       [ZLPersonModel personWithName:@"Rose" age:22 sex:ZLPersonSexFamale],
//                       [ZLPersonModel personWithName:@"Jackson" age:30 sex:ZLPersonSexMale],
//                       [ZLPersonModel personWithName:@"Johnson" age:35 sex:ZLPersonSexMale]];
//    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"name CONTAINS 'son'"];
//    NSArray *newArray = [array filteredArrayUsingPredicate:pred2];
//    NSLog(@"%@", newArray);
    
    
    /*
     首先如果我们想在谓词表达式中使用变量，那么我们需要了解下列两种占位符
     
     %K：用于动态传入属性名
     %@：用于动态设置属性值
     其实相当于变量名与变量值
     除此之外，还可以在谓词表达式中使用动态改变的属性值，就像环境变量一样
     
     NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS $VALUE"];
     
     上述表达式中，VALUE是一个可以动态变化的值，它其实最后是在字典中的一个key，所以可以根据你的需要写不同的值，
     但是必须有开头，随着程序改变$VALUE这个谓词表达式的比较条件就可以动态改变。

     */
    
//    NSArray *array = @[[ZLPersonModel personWithName:@"Jack" age:20 sex:ZLPersonSexMale],
//                       [ZLPersonModel personWithName:@"Rose" age:22 sex:ZLPersonSexFamale],
//                       [ZLPersonModel personWithName:@"Jackson" age:30 sex:ZLPersonSexMale],
//                       [ZLPersonModel personWithName:@"Johnson" age:35 sex:ZLPersonSexMale]];
//    //  定义一个property来存放属性名，定义一个value来存放值
//    NSString *property = @"name";
//    NSString *value = @"Jack";
//    //  该谓词的作用是如果元素中property属性含有值value时就取出放入新的数组内，这里是name包含Jack
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K CONTAINS %@", property, value];
//    NSArray *newArray = [array filteredArrayUsingPredicate:pred];
//    NSLog(@"newArray:%@", newArray);
//
//    //  创建谓词，属性名改为age，要求这个age包含$VALUE字符串
//    NSPredicate *predTemp = [NSPredicate predicateWithFormat:@"%K > $VALUE", @"age"];
//    // 指定$VALUE的值为 25
//    NSPredicate *pred1 = [predTemp predicateWithSubstitutionVariables:@{@"VALUE" : @25}];
//    NSArray *newArray1 = [array filteredArrayUsingPredicate:pred1];
//    NSLog(@"newArray1:%@", newArray1);
//
//    //  修改 $VALUE的值为32
//    NSPredicate *pred2 = [predTemp predicateWithSubstitutionVariables:@{@"VALUE" : @32}];
//    NSArray *newArray2 = [array filteredArrayUsingPredicate:pred2];
//    NSLog(@"newArray2:%@", newArray2);
}

#pragma mark 9.其他用法 ：
#pragma mark - 判断手机号是否正确
- (BOOL)checkPhoneNumber:(NSString *)phoneNumber
{
    NSString *regex = @"^[1][3-8]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phoneNumber];
}

#pragma mark - 检测字符串中是否有特殊字符
- (BOOL)checkSpecialCharacter:(NSString *)string
{
    NSString *regex = @"[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:string];
}

@end
