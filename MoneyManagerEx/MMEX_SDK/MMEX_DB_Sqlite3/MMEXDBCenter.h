//
//  MMEXDBCenter.h
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/17.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMEXDBCenter : NSObject

- (BOOL)initDB:(NSString *)path;

- (BOOL)releaseDB;

@end
