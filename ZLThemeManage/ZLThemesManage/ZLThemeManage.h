//
//  ZLThemeManage.h
//  ZLReader
//
//  Created by Apple on 2017/9/20.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#pragma mark  ZLUIKitProtocol  方便另外扩展
@protocol ZLUIKitProtocol <NSObject>

@required
//获取资源文件名   1 和默认定义关键字相同 2 自己定义style之类
- (NSString *)zlThemeResFilePath;
- (void)themeTarget:(id)target theme:(NSString *)theme imageForm:(UIImage* (^)(NSString *))iamgeFromKeyPath color:(UIColor *(^)(NSString *))colorForKeyPath;

@end


#pragma mark ZLThemeManage
@interface ZLThemeManage : NSObject

@property (nonatomic, strong) id<ZLUIKitProtocol> delegate;

#pragma mark - 文件指定属性修改
+ (instancetype)shareManage;

+ (void)setDelegate:(id<ZLUIKitProtocol>)delegate;
+ (void)addThemeTarget:(id)target ;
+ (void)removeThemeTarget:(id )target ;

+ (void)addThemeTargetArray:(NSArray *)targetArray;
+ (void)removeThemeTargetArray:(NSArray *)targetArray ;

#pragma mark - 指定代码修改
+ (void)addThemeBlockTargrt:(NSObject*)target block:(void(^)(void))block;
+ (void)removeThemeBlockTarget:(NSObject*)target;

+ (void)changeTheme:(NSString *)theme;



@end
