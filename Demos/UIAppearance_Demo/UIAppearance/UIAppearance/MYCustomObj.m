//
//  MYCustomObj.m
//  UIAppearance
//
//  Created by MayerF on 2017/11/24.
//  Copyright © 2017年 MayerF. All rights reserved.
//

#import "MYCustomObj.h"

@implementation MYCustomObj

+ (instancetype)appearance {
    return [MYAppearance appearanceForClass:[self class]];
}

@end
