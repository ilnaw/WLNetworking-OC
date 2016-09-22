###WLNetworking

####OC   iOS7以上

***
				/**
 				Get

 				@param url          请求链接
 				@param successBlock 成功回调
 				@param errorBlock   失败回调
 				*/
				+ (void)Get:(NSString *)url
    				success:(NetBlock )successBlock
       					fail:(ErrorBlock )errorBlock;

				/**
 				Post

 				@param url          请求链接
				@param param        参数
 				@param successBlock 成功回调
 				@param errorBlock   失败回调
 				*/
				+ (void)Post:(NSString *)url
       				   param:(NSDictionary *)param
     				 success:(NetBlock )successBlock
        				fail:(ErrorBlock )errorBlock;

				/**
 				Delete

 				@param url          请求链接
 				@param successBlock 成功回调
 				@param errorBlock   失败回调
 				*/
				+ (void)Delete:(NSString *)url
       				   success:(NetBlock )successBlock
          				  fail:(ErrorBlock )errorBlock;

				/**
 				上传图片

 				@param url           请求链接
 				@param param         参数
 				@param name          上传名称
 				@param imageArray    图片数组
 				@param progressBlock 进度回调
 				@param successBlock  成功回调
 				@param errorBlock    失败回调
 				*/
				+ (void)UploadImage:(NSString *)url
              				  param:(NSDictionary *)param
               				   name:(NSString *)name
              			 imageArray:(NSArray *)imageArray
           				   progress:(ProgressBlock )progressBlock
            				success:(NetBlock )successBlock
              				  error:(ErrorBlock )errorBlock;

				/**
 				上传文件

 				@param url           请求链接
 				@param fileName      文件名
 				@param name          上传名称
 				@param param         参数
 				@param progressBlock 进度回调
 				@param successBlock  成功回调
 				@param errorBlock    失败回调
 				*/
				+ (void)UploadFile:(NSString *)url
          				  fileName:(NSString *)fileName
              				  name:(NSString *)name
             				 param:(NSDictionary *)param
          				  progress:(ProgressBlock )progressBlock
           				   success:(NetBlock )successBlock
             				 error:(ErrorBlock )errorBlock;

				/**
 				下载文件

 				@param url           请求链接
 				@param progressBlock 进度回调
 				@param successBlock  成功回调
 				@param errorBlock    失败回调
 				*/
				+ (void)Download:(NSString *)url
        				progress:(ProgressBlock )progressBlock
         				success:(NetBlock )successBlock
           				  error:(ErrorBlock )errorBlock;
			
***

				