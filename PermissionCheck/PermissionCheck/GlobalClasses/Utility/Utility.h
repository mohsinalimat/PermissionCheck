//
//  Utility.h
//  PermissionCheck
//
//  Created by wos on 15/07/17.
//  Copyright © 2017 Ravi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

@property (copy, nonatomic) void (^successBlock)(NSString *str);
@property (copy, nonatomic) void (^failureBlock)(NSString *str);

+ (void)getPermitionOfAccess_Camera:(void (^)(NSString *strSuccess))successBlock failureBlock:(void (^)(NSString *strFailure))failureBlock;

+ (void)getPermitionOfAccess_Gallery:(void (^)(NSString *strSuccess))successBlock failureBlock:(void (^)(NSString *strFailure))failureBlock;

+ (void)getPermitionOfAccess_Audio:(void (^)(NSString *strSuccess))successBlock failureBlock:(void (^)(NSString *strFailure))failureBlock;

@end
