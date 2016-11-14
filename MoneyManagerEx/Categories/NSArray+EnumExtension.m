//
//  NSArray+EnumExtension.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/14.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "NSArray+EnumExtension.h"

@implementation NSArray (EnumExtension)

- (NSString*) stringWithEnum: (NSUInteger) enumVal
{
    return [self objectAtIndex:enumVal];
}

- (NSUInteger) enumFromString: (NSString*) strVal default: (NSUInteger) def
{
    NSUInteger n = [self indexOfObject:strVal];
    if(n == NSNotFound) n = def;
    return n;
}

- (NSUInteger) enumFromString: (NSString*) strVal
{
    return [self enumFromString:strVal default:0];
}


@end
