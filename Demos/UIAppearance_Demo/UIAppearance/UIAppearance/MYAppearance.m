//
//  MYAppearance.m
//  UIAppearance
//
//  Created by MayerF on 2017/11/24.
//  Copyright © 2017年 MayerF. All rights reserved.
//

#import "MYAppearance.h"

/*
    1. 外观代理MYAppearance实例中暂存着对应类实例需要设置的外观信息
    2. 某个时间段类实例invoke外观代理中暂存的外观信息来更新外观
 */

static NSMutableDictionary *instanceOfClassesDictionary = nil;

@interface MYAppearance ()
@property (strong, nonatomic) Class mainClass;
@property (strong, nonatomic) NSMutableArray *invocations;
@end

@implementation MYAppearance

- (id)initWithClass:(Class)thisClass
{
    _mainClass = thisClass;
    _invocations = [NSMutableArray array];
    
    return self;
}
+ (id)appearanceForClass:(Class)aClass
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instanceOfClassesDictionary = [[NSMutableDictionary alloc] init];
    });
    
    if (![instanceOfClassesDictionary objectForKey:NSStringFromClass(aClass)])
    {
        id appearance = [[self alloc] initWithClass:aClass];
        [instanceOfClassesDictionary setObject:appearance forKey:NSStringFromClass(aClass)];
        return appearance;
    }
    else {
        return [instanceOfClassesDictionary objectForKey:NSStringFromClass(aClass)];
    }
}

// MYAppearance实例收到任何消息后的触发
// 默认是 [invocation setTarget:target];
// [invocation invoke]; 直接执行方法。但是当前重写后保留，给真正的调用者MYCustomObj(对当前工程而言)
- (void)forwardInvocation:(NSInvocation *)anInvocation;
{
    [anInvocation setTarget:nil];
    [anInvocation retainArguments];
    
    [self.invocations addObject:anInvocation];
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [self.mainClass instanceMethodSignatureForSelector:aSelector];
}

- (void)applyInvocationTo:(id)target
{
    for (NSInvocation *invocation in self.invocations) {
        //target执行当前invocation中的所有消息
        [invocation setTarget:target];
        [invocation invoke];
    }
}

@end
