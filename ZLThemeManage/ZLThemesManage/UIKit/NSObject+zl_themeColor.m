//
//  NSObject+zl_themeColor.m
//  ZLReader
//
//  Created by Apple on 2017/9/21.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import "NSObject+zl_themeColor.h"
#import <objc/runtime.h>
@implementation NSObject (zl_themeColor)


- (void)setZl_setTheme:(void (^)())zl_setTheme{
    objc_setAssociatedObject(self, @"zl_setTheme", zl_setTheme, OBJC_ASSOCIATION_COPY);
}

- (void (^)())zl_setTheme{
    return objc_getAssociatedObject(self, @"zl_setTheme");
}




@end
