//
//  conditionLimitedConfig.h
//  LYG_UsefulFragments_iOS
//
//  Created by liuyang on 17/4/21.
//  Copyright © 2017年 com.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface conditionLimitedConfig : NSObject
//输入框中只能输入数字和小数点，且小数点只能输入一位，参数number 可以设置小数的位数，该函数在-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string调用；
+(BOOL)isValidAboutInputText:(UITextField *)textfield shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string  decimalNumber: (NSInteger) number;

@end
