//
//  ZLThemeManage.m
//  ZLReader
//
//  Created by Apple on 2017/9/20.
//  Copyright © 2017年 zhilong. All rights reserved.
//

#import "ZLThemeManage.h"
#import "ZLThemeHandle.h"

#import "NSObject+zl_theme.h"

#pragma mark ZLThemeManage() 类别

@interface ZLThemeManage()

@property (nonatomic, strong) NSMutableSet *themeBlocksTarget;
@property (nonatomic, strong) NSMutableSet *targetSet;
@property (nonatomic, strong) ZLThemeHandle *themeHandle;
@property (nonatomic, strong) NSString * zl_theme;

@end

#pragma mark  ZLThemeManage 实现
@implementation ZLThemeManage


+ (instancetype)shareManage{
    static ZLThemeManage *manage;
    static dispatch_once_t once_t;
    dispatch_once(&once_t, ^{
        if (manage == nil) {
            manage = [[ZLThemeManage alloc] init];
            manage.themeBlocksTarget = [[NSMutableSet alloc] init];
            manage.targetSet = [[NSMutableSet alloc] init];
            manage.theme = [NSString stringWithFormat:@"normal"];
        }
    });
    return manage;
}


#pragma mark - 文件指定属性修改
+ (void)addThemeTarget:(id)target{
    __weak typeof(target) wtarget = target;
    [[ZLThemeManage shareManage].targetSet addObject:wtarget];
    [[ZLThemeManage shareManage] configTargetTheme:wtarget];
}
+ (void)removeTarget:(id )target{
    if ([[ZLThemeManage shareManage].targetSet containsObject:target]) {
        [[ZLThemeManage shareManage].targetSet removeObject:target];
    }
}

+ (void)addThemeTargetArray:(NSArray *)targetArray{
    for (id target in targetArray) {
        [ZLThemeManage addThemeTarget:target];
    }
}
+ (void)removeThemeTargetArray:(NSArray *)targetArray{
    for (id target in targetArray) {
        [ZLThemeManage removeThemeTarget:target];
    }
}

#pragma mark - 指定代码修改
+ (void)setDelegate:(id<ZLUIKitProtocol>)delegate{
    [[ZLThemeManage shareManage] setDelegate:delegate];
    
}
+ (void)addThemeBlock:(NSObject *)target block:(void(^)(void))block{
    __weak typeof(target) wtarget = target;
    [wtarget setZl_setTheme:block];
    [[ZLThemeManage shareManage].themeBlocksTarget addObject:wtarget];
    [[ZLThemeManage shareManage] configTargetTheme:wtarget];
}
+ (void)removeThemeBlock:(NSObject *)target{
    if ([[ZLThemeManage shareManage].themeBlocksTarget containsObject:target]) {
        [[ZLThemeManage shareManage].themeBlocksTarget removeObject:target];
    }
}



+ (void)changeTheme:(NSString *)theme{
    if ([theme isEqualToString:[ZLThemeManage shareManage].zl_theme ]) {
        return;
    }else{
        [[ZLThemeManage shareManage] setTheme:theme];
    }
}


#pragma mark 私有方法
- (void)setTheme:(NSString *)theme{
    for (id target in self.targetSet) {
        [self.themeHandle handleThemeTarget:target theme:theme];
        if (self.delegate != nil) {
            [self.delegate themeTarget:target theme:theme imageForm:^UIImage *(NSString *path) {
                return [self.themeHandle getImageForKeyPath:path];
            } color:^UIColor *(NSString *path) {
                return  [self.themeHandle getColorForKeyPath:path];
            }];
        }
    }
    for (NSObject * target in self.themeBlocksTarget) {
        if (target!= nil && target.zl_setTheme!= nil) {
            target.zl_setTheme();
        }
    }
}

- (void)configTargetTheme:(NSObject *)target{
    [self.themeHandle handleThemeTarget:target theme:self.zl_theme ];
    if (self.delegate != nil) {
        [self.delegate themeTarget:target theme:self.zl_theme imageForm:^UIImage *(NSString *path) {
            return [self.themeHandle getImageForKeyPath:path];
        } color:^UIColor *(NSString *path) {
            return  [self.themeHandle getColorForKeyPath:path];
        }];
    }
    if (target!= nil && target.zl_setTheme!= nil) {
        target.zl_setTheme();
    }
}


#pragma mark  getter setter
- (ZLThemeHandle *)themeHandle{
    if (_themeHandle == nil) {
        _themeHandle = [[ZLThemeHandle alloc] init];
    }
    if (self.delegate != nil ) {
        NSString *filePath = [self.delegate zlThemeResFilePath];
        if (![filePath isEqualToString:_themeHandle.resPath]) {
            _themeHandle.resPath = filePath;
        }
    }
    return _themeHandle;
}

- (NSString *)zl_theme{
    if (_zl_theme == nil) {
        return  @"normal";
    }
    return _zl_theme;
}

@end
