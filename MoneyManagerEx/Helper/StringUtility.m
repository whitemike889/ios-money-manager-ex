//
//  StringUtility.m
//  MoneyManagerEx
//
//  Created by taotao on 16/7/9.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "StringUtility.h"

@implementation StringUtility

+ (NSString *)getPinYinFromString:(NSString *)str
{
    if (!str) {
        return nil;
    }
    NSMutableString *pinyin = [[NSMutableString alloc] initWithString:str];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, 0, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, 0, kCFStringTransformStripDiacritics, NO);
    return pinyin;
}

+ (NSString *)getFirstLetterFromPinyin:(NSString *)str
{
    if (!str) {
        return nil;
    }
    
    return [str substringToIndex:1];
}

+ (NSString *)getFirstLetterOfChineseString:(NSString *)str
{
    NSString *result = @"";
    for (NSInteger i = 0; i < str.length; i++) {
        NSString *tmp = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *pinyin = [self getPinYinFromString:tmp];
        NSString *firstLetter = [self getFirstLetterFromPinyin:pinyin];
        result = [result stringByAppendingString:firstLetter];
    }
    
    return result;
}

@end
