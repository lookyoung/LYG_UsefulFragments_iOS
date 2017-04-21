//
//  Model.m
//  LYG_UsefulFragments_iOS
//
//  Created by liuyang on 17/4/21.
//  Copyright © 2017年 com.me. All rights reserved.
//

#import "Model.h"

@implementation Model
//容错处理方法, 调用model对象赋值解析的数据时, 若发生属性不一致情况,则不会崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
//description方法是程序员的测试方法, 在控制台中打印出汉字
- (NSString *)description{
    
    return [NSString stringWithFormat:@"%@", _profile];
}
@end
