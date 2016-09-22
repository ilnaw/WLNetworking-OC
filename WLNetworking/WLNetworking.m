//
//  WLNetworking.m
//  WLNetworking
//
//  Created by wanli on 16/9/22.
//  Copyright © 2016年 wanli. All rights reserved.
//

#import "WLNetworking.h"

@implementation WLNetworking
+ (void)Get:(NSString *)url success:(NetBlock)successBlock fail:(ErrorBlock)errorBlock
{
    url=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

+ (void)Post:(NSString *)url param:(NSDictionary *)param success:(NetBlock)successBlock fail:(ErrorBlock)errorBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//设置接收数据格式
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //设置header
//    manager.requestSerializer setValue:<#(nullable NSString *)#> forHTTPHeaderField:<#(nonnull NSString *)#>
    
    [manager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (successBlock)
        {
            successBlock(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock)
        {
            errorBlock(error);
        }
    }];

}
+ (void)Delete:(NSString *)url success:(NetBlock)successBlock fail:(ErrorBlock)errorBlock
{
    url=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager DELETE:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock)
        {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock)
        {
            errorBlock(error);
        }
    }];
}
+ (void)UploadImage:(NSString *)url param:(NSDictionary *)param name:(NSString *)name imageArray:(NSArray *)imageArray progress:(ProgressBlock)progressBlock success:(NetBlock)successBlock error:(ErrorBlock)errorBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<imageArray.count; i++) {
            
            UIImage *image =[imageArray objectAtIndex:i];
            NSData *fileData = UIImageJPEGRepresentation(image, 0.1);
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            
            if (fileData != NULL) {
                [formData appendPartWithFileData:fileData name:name fileName:fileName mimeType:@"image/png"];
            }
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progressBlock) {
            progressBlock(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock)
        {
            errorBlock(error);
        }
        
    }];

}
+ (void)UploadFile:(NSString *)url fileName:(NSString *)fileName name:(NSString *)name param:(NSDictionary *)param progress:(ProgressBlock)progressBlock success:(NetBlock)successBlock error:(ErrorBlock)errorBlock
{
    NSArray *arr  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [arr objectAtIndex:0];
    NSString *path = [documentPath stringByAppendingString:fileName];
    NSString *filePath = path;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileURL:[NSURL URLWithString:filePath] name:name error:nil];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progressBlock) {
            progressBlock(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock)
        {
            errorBlock(error);
        }
    }];

}
@end
