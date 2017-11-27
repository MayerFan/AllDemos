//
//  MYAppearance.h
//  UIAppearance
//
//  Created by MayerF on 2017/11/24.
//  Copyright © 2017年 MayerF. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MYAppearance <NSObject>
+ (instancetype)appearance;
@end

@interface MYAppearance : NSObject

+ (id)appearanceForClass:(Class)aClass;
/**
 Applies the appearance to the object.
 implementation: send message retained in appearance proxy to target
 */
- (void)applyInvocationTo:(id)target;

@end
