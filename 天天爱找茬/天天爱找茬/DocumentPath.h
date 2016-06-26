//
//  DocumentPath.h
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DocumentPath : NSObject
+(NSString *) Floder:(NSString *) floderName FileName:(NSString *) fileName;
+(BOOL) ExsitFile:(NSString *) floderName FileName:(NSString *) fileName;
@end
