//
//  InputFieldViewController.m
//  LYG_UsefulFragments_iOS
//
//  Created by liuyang on 17/4/21.
//  Copyright © 2017年 com.me. All rights reserved.
//

#import "InputFieldViewController.h"
#import "conditionLimitedConfig.h"

@interface InputFieldViewController ()<UITextFieldDelegate>

@end

@implementation InputFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"NSScanner_application";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 250, 300, 40)];
    textField.placeholder = @"输入框中只能输入数字和小数点，且小数点只能输入一位";
    textField.inputView.backgroundColor = [UIColor lightGrayColor];
    textField.borderStyle = UITextBorderStyleBezel;
    textField.delegate = self;
    [self.view addSubview:textField];
    // Do any additional setup after loading the view.
}

// http://www.jianshu.com/p/fbebd33d5b34
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [conditionLimitedConfig isValidAboutInputText:textField shouldChangeCharactersInRange:range replacementString:string decimalNumber:5];
}
/**
 
 NSScanner类是一个类簇的抽象父类,该类簇为一个从NSString对象扫描值的对象提供了程序接口。
 
 NSScanner对象把NSString 对象的的字符解释和转化成 number和string 类型的值。在创建NSScanner对象的时候为它分配字符(string )，当你从NSScanner对象获取内容的时候，它会从头到尾遍历字符串(string)。
 
 由于类簇的属性， scanner对象并不是 NSScanner类的实例，而是它一个私有子类的实例。尽管scanner对象的类是私有的，但是它的接口是公开的（抽象父类已经声明）。 NSScanner 的原始方法是string和Configuring a Scanner方法下面列举的所有的方法。
 
 在 NSScanner 对象扫描字符串的时候，你可以通过设置属性charactersToBeSkipped忽略某些字符。在扫描字符串之前，那些位于忽略字符集中的字符将会被跳过。默认的忽略字符是空格和回车字符。
 
 可以通过[[scanner string] substringFromIndex:[scanner scanLocation]]获取未扫描的字符串。
 
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
