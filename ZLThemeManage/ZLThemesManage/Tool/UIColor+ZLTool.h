//
//  UIColor+ZLTool.h
//  ZLReader
//
//  Created by Apple on 2017/12/21.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIColor (ZLTool)

+ (UIColor *) colorWithHexString: (NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(float)alpha;
@end
