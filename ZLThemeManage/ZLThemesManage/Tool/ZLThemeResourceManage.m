//
//  ZLThemeResourceManage.m
//  ZLReader
//
//  Created by Apple on 2017/12/20.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import "ZLThemeResourceManage.h"
#import "UIColor+ZLTool.h"
@interface ZLThemeResourceManage()

@property (nonatomic, strong) NSDictionary  *themesData;
@property (nonatomic, strong) NSString *filePath;
@end
@implementation ZLThemeResourceManage

+ (instancetype)getInstance{
    
    return [ZLThemeResourceManage getInstanceWithFilePath:nil];
}
+ (instancetype)getInstanceWithFilePath:(NSString *)filePath{
    ZLThemeResourceManage *resM = [[ZLThemeResourceManage alloc] init];
    [resM setFilePath: filePath];
    [resM readFile];
    return resM;
}



- (void)readFile{
    if (self.filePath == nil) {
        self.filePath = [[NSBundle mainBundle] pathForResource:@"zlthemes" ofType:@"plist"];
    }
    self.themesData = [NSDictionary dictionaryWithContentsOfFile:self.filePath];
}

- (UIColor *)getColorForKeyPath:(NSString *)keyPath{
    NSString *value =  [self.themesData valueForKeyPath:keyPath];
    UIColor *color = nil;
    if ([value hasPrefix:@"#"] ) {
        color = [UIColor colorWithHexString:value];
    }else {
        color = [UIColor redColor];
    }
    return  color;
}
- (UIImage *)getImageForKeyPath:(NSString *)keyPath{
    NSString *value =  [self.themesData valueForKeyPath:keyPath];
    UIImage *image = nil;
    if ([value hasPrefix:@"#"] ) {
//        image = [UIImage colorWithHexString:value];
    }else {
        image = [UIImage imageNamed:value];
    }
    return  image;
}

//
//- (NSDictionary *)getTheme:(nonnull NSString *)theme{
//    return [self.themesData objectForKey:theme];
//}
//- (NSDictionary *)getStyle:(NSString *)style theme:(nonnull NSString *)theme{
//    NSDictionary *dic = [self.themesData objectForKey:theme];
//    if (dic != nil) {
//        return  [dic objectForKey:style];
//    }
//    return nil;
//}
//
//- (UIColor *)getColor:(nonnull NSString *)name style:(NSString *)style theme:(nonnull NSString *)theme{
//    NSDictionary *dic = [self.themesData objectForKey:theme];
//    if (dic != nil) {
//        NSDictionary *theme =  [dic objectForKey:style];
//        if (theme!= nil && [theme isKindOfClass:[NSDictionary class]]) {
//            NSString *colorValue = [theme objectForKey:name];
//            if (colorValue!=nil && [colorValue isKindOfClass:[NSString class]]) {
//                return [UIColor redColor];
//            }
//        }
//    }
//    return nil;
//}
//- (UIImage *)getImage:(nonnull NSString *)name style:(NSString *)style theme:(nonnull NSString *)theme{
//    NSDictionary *dic = [self.themesData objectForKey:theme];
//    if (dic != nil) {
//        if (style!= nil) {
//            NSDictionary *theme =  [dic objectForKey:style];
//            if (theme!= nil && [theme isKindOfClass:[NSDictionary class]]) {
//                NSString *ImageName = [theme objectForKey:name];
//                if (ImageName!=nil && [ImageName isKindOfClass:[NSString class]]) {
//                    return [UIImage imageNamed:ImageName];
//                }
//            }
//        }
//        
//    }
//    return nil;
//}


@end
