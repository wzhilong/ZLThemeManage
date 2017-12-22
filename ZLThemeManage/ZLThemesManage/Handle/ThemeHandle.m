//
//  ThemeFactory.m
//  ZLReader
//
//  Created by Apple on 2017/12/20.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import "ThemeHandle.h"
#import <UIKit/UIKit.h>
#import "ZLThemeResourceManage.h"
@interface ThemeHandle(){
    
}

@property (nonatomic, strong) ZLThemeResourceManage *resManage;
@end
@implementation ThemeHandle

- (instancetype)initWithFilePath:(NSString *)filePath{
    if (self = [super init]) {
        self.resManage = [ZLThemeResourceManage getInstanceWithFilePath:filePath];
    }
    return  self;
}

-  (instancetype)init{
    return [self initWithFilePath:nil];
}

- (void)handleThemeTarget:(id)target theme:(NSString *)theme{
    if ([target isKindOfClass:[UIViewController class]]) {
        UIViewController *vc = (UIViewController *)target;
        
        
        ZLThemeResourceManage *zlM = [ZLThemeResourceManage getInstance];
        vc.view.backgroundColor = [zlM getColorForKeyPath:[NSString stringWithFormat:@"%@.vc.bg",theme]];
        if (vc.navigationController!=nil) {
            [vc.navigationController.navigationBar setBackgroundColor:[zlM getColorForKeyPath:[NSString stringWithFormat:@"%@.vc.nav_bg",theme]]];
            
        }
        if (vc.tabBarController!=nil ) {
            [vc.tabBarController.tabBar setBackgroundColor:[zlM getColorForKeyPath:[NSString stringWithFormat:@"%@.vc.tab_bg",theme]]];
        }
    }
    else if ([target isKindOfClass:[UIButton class]]){
        
    }
    else if ([target isKindOfClass:[UIButton class]]){
        
    }
    else if ([target isKindOfClass:[UIButton class]]){
        
    }
    else if ([target isKindOfClass:[UIButton class]]){
        
    }
    else if ([target isKindOfClass:[UIButton class]]){
        
    }
    else if ([target isKindOfClass:[UIButton class]]){
        
    }
    else if ([target isKindOfClass:[UIButton class]]){
        
    }
}

- (UIColor *)getColorForKeyPath:(NSString *)keyPath{
    return [self.resManage getColorForKeyPath:keyPath];
}

- (UIImage *)getImageForKeyPath:(NSString *)keyPath{
    return [self.resManage getImageForKeyPath:keyPath];
}
@end
