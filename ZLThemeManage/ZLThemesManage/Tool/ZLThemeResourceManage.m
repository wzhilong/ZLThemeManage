//
//  ZLThemeResourceManage.m
//  ZLReader
//
//  Created by Apple on 2017/12/20.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import "ZLThemeResourceManage.h"
#import "UIColor+ZLTool.h"
#import "NSObject+zl_theme.h"
@interface ZLThemeResourceManage()

@property (nonatomic, strong) NSDictionary  *themesData;
@property (nonatomic, strong) NSString *filePath;

@property (nonatomic, strong) NSDictionary *resData;
@end


@implementation ZLThemeResourceManage
+ (instancetype)getInstance{
     ZLThemeResourceManage *resM = [[ZLThemeResourceManage alloc] init];
    return resM;
}

#pragma mark  public
- (NSDictionary *)getAttributForKeyPath:(NSString *)keyPath{
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    if (self.themesData!= nil) {
        NSDictionary *dic = [self.themesData valueForKeyPath:keyPath];
        [attribute addEntriesFromDictionary:dic];
    }
    if (self.resData != nil) {
        NSDictionary *dic  = [self.resData valueForKeyPath:keyPath];
        [attribute addEntriesFromDictionary:dic];
    }
    [self configValueForDic:attribute];
    return attribute;
}


- (UIColor *)getColorForKeyPath:(NSString *)keyPath{
    NSString *value =  [self.themesData valueForKeyPath:keyPath];
    UIColor *color = [self getColorFromString:value];
    return  color;
}
- (UIImage *)getImageForKeyPath:(NSString *)keyPath{
    NSString *value =  [self.themesData valueForKeyPath:keyPath];
    UIImage *image = [self getImageFromString:value];
    return  image;
}

#pragma mark private

- (void)configValueForDic:(NSDictionary *)dic{
    for (NSString *key in [dic allKeys]) {
        id value = [dic objectForKey:key];
        if ([value isKindOfClass:[NSDictionary class]]) {
            [self configValueForDic:value];
        }
        if ([value isKindOfClass:[NSString class]]) {
            value = [self getValueFromKey:key StringValue:value];
            [dic setValue:value forKey:key];
        }
    }
}
- (id)getValueFromKey:(NSString *)key StringValue:(NSString *)value{
    if ([value hasPrefix:@"#"] || [key localizedCaseInsensitiveContainsString:@"color"]) {
        return [UIColor colorWithHexString:value];
    }
    if ([value hasPrefix:@"Img_"] && [key localizedCaseInsensitiveContainsString:@"image"]) {
        return  [UIImage imageNamed:value];
    }
    if ([value hasPrefix:@"Font_"] || [key localizedCaseInsensitiveContainsString:@"font"]) {
        float floatValue = value.floatValue;
        if (floatValue!=0) {
            return  [UIFont systemFontOfSize:floatValue];
        }
    }
    return nil;
}

- (UIImage *)getImageFromString:(NSString *)str{
    return  [UIImage imageNamed:str];
}
- (UIColor *)getColorFromString:(NSString *)str{
    return  [UIColor whiteColor];
}
- (UIFont *)getFontFormString:(NSString *)str{
    return [UIFont systemFontOfSize:18];
}



#pragma mark getter setter
- (NSString *)filePath{
    if (_filePath == nil) {
        self.filePath = [[NSBundle mainBundle] pathForResource:@"zlthemes" ofType:@"plist"];
        self.themesData = [NSDictionary dictionaryWithContentsOfFile:_filePath];
    }
    return _filePath;
}


- (void)setResFilePath:(NSString *)resFilePath{
    if ([[NSFileManager defaultManager] fileExistsAtPath:resFilePath]) {
        _filePath = resFilePath;
    }else{
        _resFilePath = nil;
    }
}
- (NSDictionary *)resData{
    if (_resData == nil && self.resFilePath != nil) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:_resFilePath]) {
            self.resData = [NSDictionary dictionaryWithContentsOfFile:_resFilePath];
        }else{
            self.resFilePath = nil;
        }
    }
    return _resData;
}

@end
