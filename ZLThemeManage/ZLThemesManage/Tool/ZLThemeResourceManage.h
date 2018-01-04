//
//  ZLThemeResourceManage.h
//  ZLReader
//
//  Created by Apple on 2017/12/20.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZLThemeResourceManage : NSObject

@property (nonatomic, strong) NSString *resFilePath;

+ (instancetype)getInstance;
- (NSDictionary *)getAttributForKeyPath:(NSString *)keyPath;
- (UIColor *)getColorForKeyPath:(NSString *)keyPath;
- (UIImage *)getImageForKeyPath:(NSString *)keyPath;

@end
