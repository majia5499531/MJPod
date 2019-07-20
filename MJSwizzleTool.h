//
//  MJSwizzleTool.h
//  复习App
//
//  Created by 马佳 on 2019/7/18.
//  Copyright © 2019 iBeseLove. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJSwizzleTool : NSObject

+(void)MJSwizzleWithClass:(Class)cls OriginSel:(SEL)sel1 NewSel:(SEL)sel2;

@end

NS_ASSUME_NONNULL_END
