//
//  NSArray+EnumExtension.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/14.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (EnumExtension)

- (NSString*) stringWithEnum: (NSUInteger) enumVal;
- (NSUInteger) enumFromString: (NSString*) strVal default: (NSUInteger) def;
- (NSUInteger) enumFromString: (NSString*) strVal;

@end
