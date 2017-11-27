//
//  MYContainerView.m
//  UIAppearance
//
//  Created by MayerF on 2017/11/27.
//  Copyright © 2017年 MayerF. All rights reserved.
//

#import "MYContainerView.h"

@implementation MYContainerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        UISwitch *switch3 = [[UISwitch alloc] initWithFrame:CGRectMake(10, 0, 50, 30)];
        
        [self addSubview:switch3];
    }
    return self;
}

@end
