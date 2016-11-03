//
//  NSDate+Format.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/4.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "NSDate+Format.h"

@implementation NSDate (Format)

- (NSString *)getChineseDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY年MM月dd日"];
    NSString *resultStr = [formatter stringFromDate:self];
    
    return resultStr;
}

@end
