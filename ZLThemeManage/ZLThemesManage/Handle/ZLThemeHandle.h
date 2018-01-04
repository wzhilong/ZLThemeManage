//
//  ThemeFactory.h
//  ZLReader
//
//  Created by Apple on 2017/12/20.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <UIKit/UIKit.h>

@interface ZLThemeHandle : NSObject
@property (nonatomic, strong) NSString  *resPath;
- (void)handleThemeTarget:(id)target  theme:(NSString *)theme;

- (UIColor *)getColorForKeyPath:(NSString *)keyPath;
- (UIImage *)getImageForKeyPath:(NSString *)keyPath;

@end
