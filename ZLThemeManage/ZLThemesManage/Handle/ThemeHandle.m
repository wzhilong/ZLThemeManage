//
//  ThemeFactory.m
//  ZLReader
//
//  Created by Apple on 2017/12/20.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import "ZLThemeHandle.h"
#import <UIKit/UIKit.h>
#import "NSObject+zl_theme.h"
#import "ZLThemeResourceManage.h"

@interface ZLThemeHandle()
@property (nonatomic, strong) ZLThemeResourceManage *zlTMManage;
@property (nonatomic, strong) ZLThemeResourceManage *resManage;
@end

@implementation ZLThemeHandle


- (void)handleThemeTarget:(id)target theme:(NSString *)theme{
    if (target == nil) {
        return ;
    }
    NSString *key ;
    if ([target isKindOfClass:[UIView class]]) {
    }
    if ([target isKindOfClass:[UIViewController class]]) {
        
    }
    if ([target isKindOfClass:[UILabel class]]) {
        
    }
    if ([target isKindOfClass:[UIButton class]]) {
        
    }
}
- (NSString *)getKeyForTargrt:(id)target{
    id obj = target;
    return @"";
}




- (UIColor *)getColorForKeyPath:(NSString *)keyPath{
    return [self.resManage getColorForKeyPath:keyPath];
}

- (UIImage *)getImageForKeyPath:(NSString *)keyPath{
    return [self.resManage getImageForKeyPath:keyPath];
}

#pragma mark getter setter
- (ZLThemeResourceManage *)zlTMManage{
    if (_zlTMManage == nil) {
        _zlTMManage = [[ZLThemeResourceManage alloc] init];
    }
    return _zlTMManage;
}
@end
