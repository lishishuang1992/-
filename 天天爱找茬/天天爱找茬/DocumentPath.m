//
//  DocumentPath.m
//  天天爱找茬
//
//  Created by 欧阳先生 on 16/4/24.
//  Copyright © 2016年 欧阳先生. All rights reserved.
//

#import "DocumentPath.h"

@implementation DocumentPath
static NSString *documentPath;

+(NSString *) Floder:(NSString *) floderName FileName:(NSString *) fileName
{
    if(!documentPath)
    {
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentPath=[paths objectAtIndexedSubscript:0];
    }
    NSString *path=[NSString stringWithFormat:@"%@/%@",documentPath,floderName];
    NSFileManager *manager=[[NSFileManager alloc]init];
    [manager createDirectoryAtPath:path withIntermediateDirectories:NO attributes: nil error:nil];
    NSString *floder=[ [NSString alloc]initWithFormat:@"%@/%@",path,fileName];
    return floder;
}

+(BOOL) ExsitFile:(NSString *) floderName FileName:(NSString *) fileName
{
    if(!documentPath){
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentPath=[paths objectAtIndexedSubscript:0];
    }
    
    NSString *path=[ [NSString alloc]initWithFormat:@"%@/%@/%@",documentPath,floderName,fileName];
    NSFileManager *manager=[[NSFileManager alloc]init];
    return [manager fileExistsAtPath:path isDirectory:0];
}
@end
