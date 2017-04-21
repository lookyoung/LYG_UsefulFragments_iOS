//
//  Model.h
//  LYG_UsefulFragments_iOS
//
//  Created by liuyang on 17/4/21.
//  Copyright © 2017年 com.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
//model类的属性, 必须和plist文件里一致(这样才能把对象整体赋值给model对象)
@property (nonatomic, copy) NSString *profile;
@property (nonatomic, copy) NSString *title;
@end
