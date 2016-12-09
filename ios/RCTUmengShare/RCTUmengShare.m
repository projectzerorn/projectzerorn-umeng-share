

#import "RCTUmengShare.h"
#import "RCTConvert.h"
#import "RCTImageLoader.h"
#import "RCTImageSource.h"
#import "RCTConvert.h"
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UMSocialUIManager.h>

static RCTUmengShare *_instance = nil;

@interface RCTUmengShare ()
@property (weak,nonatomic) UIViewController* rootViewController;
@property (strong,nonatomic) NSString* umengAppKey;
@end

@implementation RCTUmengShare
@synthesize bridge = _bridge;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(_instance == nil) {
            _instance = [[self alloc] init];
        }
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(_instance == nil) {
            _instance = [super allocWithZone:zone];
            //            [_instance setupUMessage];
        }
    });
    return _instance;
}

+(void)setRootController:(UIViewController *)rootController
{
    [RCTUmengShare sharedInstance].rootViewController = rootController;
}
RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(setAppKey:(NSString*)appKey)
{
    
//    //打开调试日志
//    [[UMSocialManager defaultManager] openLog:YES];
    
    self.umengAppKey = appKey;
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:appKey];
    
    //如果不想显示平台下的某些类型，可用以下接口设置
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[
                                                                                @(UMSocialPlatformType_Sina),          //新浪
//                                                                                @(UMSocialPlatformType_WechatSession), //微信聊天
//                                                                                @(UMSocialPlatformType_WechatTimeLine),//微信朋友圈
//                                                                                @(UMSocialPlatformType_WechatFavorite),//微信收藏
//                                                                                @(UMSocialPlatformType_QQ),            //QQ聊天页面
//                                                                                @(UMSocialPlatformType_Qzone),         //qq空间
                                                                                @(UMSocialPlatformType_TencentWb),     //腾讯微博
                                                                                @(UMSocialPlatformType_AlipaySession), //支付宝聊天页面
                                                                                @(UMSocialPlatformType_YixinSession),  //易信聊天页面
                                                                                @(UMSocialPlatformType_YixinTimeLine), //易信朋友圈
                                                                                @(UMSocialPlatformType_YixinFavorite), //易信收藏
                                                                                @(UMSocialPlatformType_LaiWangSession),//点点虫（原来往）聊天页面
                                                                                @(UMSocialPlatformType_LaiWangTimeLine),//点点虫动态
//                                                                                @(UMSocialPlatformType_Sms),           //短信
                                                                                @(UMSocialPlatformType_Email),         //邮件
                                                                                @(UMSocialPlatformType_Renren),        //人人
                                                                                @(UMSocialPlatformType_Facebook),      //Facebook
                                                                                @(UMSocialPlatformType_Twitter),       //Twitter
                                                                                @(UMSocialPlatformType_Douban),        //豆瓣
                                                                                @(UMSocialPlatformType_KakaoTalk),     //KakaoTalk（暂未支持）
                                                                                @(UMSocialPlatformType_Pinterest),     //Pinterest（暂未支持）
                                                                                @(UMSocialPlatformType_Line),          //Line
                                                                                @(UMSocialPlatformType_Linkedin),      //领英
                                                                                @(UMSocialPlatformType_Flickr),        //Flickr
                                                                                @(UMSocialPlatformType_Tumblr),        //Tumblr（暂未支持）
                                                                                @(UMSocialPlatformType_Instagram),     //Instagram
                                                                                @(UMSocialPlatformType_Whatsapp)      //Whatsapp
                                                                            ]];
}

RCT_EXPORT_METHOD(setWXAppId:(NSString*)appId appSecret:(NSString*)appSecret url:(NSString*)url)
{
    //设置微信的appId和appKey
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:appId appSecret:appSecret redirectURL:url];
}

RCT_EXPORT_METHOD(setQQWithAppId:(NSString*)appId appKey:(NSString*)appKey url:(NSString*)url)
{
    //设置分享到QQ互联的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:appId  appSecret:nil redirectURL:url];
}

RCT_EXPORT_METHOD(openNewSinaSSOWithAppKey:(NSString*)appKey secret:(NSString*)secret RedirectURL:(NSString*)url)
{
//    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:appKey
//                                              secret:secret
//                                         RedirectURL:url];
}

RCT_EXPORT_METHOD(openNewSinaSSOWithRedirectURL:(NSString*)redirectUrl)
{
//    [UMSocialSinaSSOHandler openNewSinaSSOWithRedirectURL:redirectUrl];
}

RCT_EXPORT_METHOD(hiddenNotInstallPlatforms)
{
//    if (![WXApi isWXAppInstalled]) {
//        NSLog(@"没安装微信");
//        //ShareToWechatFavorite需要单独判断，不然总是会隐藏
//        [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatFavorite]];
//    }
//    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQQ,UMShareToQzone,UMShareToSina]];
}

RCT_EXPORT_METHOD(setQQData:(NSDictionary*)dic)
{

//    RCTImageSource* source = [RCTConvert RCTImageSource:[dic objectForKey:@"imageSource"]];
//    __weak RCTUmengShare *weakSelf = self;
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:source.imageURL.absoluteString]];
//    [self.bridge.imageLoader loadImageWithURLRequest:urlRequest
//                                            callback:^(NSError *error, UIImage *image) {
//                                                if(image == nil)
//                                                {
//                                                    return;
//                                                }
//                                                dispatch_async(dispatch_get_main_queue(), ^{
//                                                    [UMSocialData defaultData].extConfig.qqData.url= [[dic objectForKey:@"url"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//                                                    [UMSocialData defaultData].extConfig.qqData.title= [dic objectForKey:@"title"];
//                                                    [UMSocialData defaultData].extConfig.qqData.shareText= [dic objectForKey:@"content"];
//                                                    [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeDefault;
//                                                    if(error == nil)
//                                                    {
//                                                        [UMSocialData defaultData].extConfig.qqData.shareImage = image;
//                                                    }
//                                                });
//
//                                            }];

}

RCT_EXPORT_METHOD(setQzoneData:(NSDictionary*)dic)
{
//    RCTImageSource* source = [RCTConvert RCTImageSource:[dic objectForKey:@"imageSource"]];
//    __weak RCTUmengShare *weakSelf = self;
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:source.imageURL.absoluteString]];
//    [self.bridge.imageLoader loadImageWithURLRequest:urlRequest
//                                            callback:^(NSError *error, UIImage *image) {
//                                                if(image == nil)
//                                                {
//                                                    return;
//                                                }
//                                                dispatch_async(dispatch_get_main_queue(), ^{
//                                                    [UMSocialData defaultData].extConfig.qzoneData.url= [[dic objectForKey:@"url"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//                                                    [UMSocialData defaultData].extConfig.qzoneData.title= [dic objectForKey:@"title"];
//                                                    [UMSocialData defaultData].extConfig.qzoneData.shareText= [dic objectForKey:@"content"];
//                                                    if(error == nil)
//                                                    {
//                                                        [UMSocialData defaultData].extConfig.qzoneData.shareImage = image;
//                                                    }
//                                                });
//
//                                            }];
}

RCT_EXPORT_METHOD(setWechatSessionData:(NSDictionary*)dic)
{
//    RCTImageSource* source = [RCTConvert RCTImageSource:[dic objectForKey:@"imageSource"]];
//    __weak RCTUmengShare *weakSelf = self;
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:source.imageURL.absoluteString]];
//    [self.bridge.imageLoader loadImageWithURLRequest:urlRequest
//                                            callback:^(NSError *error, UIImage *image) {
//                                                if(image == nil)
//                                                {
//                                                    return;
//                                                }
//                                                dispatch_async(dispatch_get_main_queue(), ^{
//                                                    [UMSocialData defaultData].extConfig.wechatSessionData.url= [[dic objectForKey:@"url"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//                                                    [UMSocialData defaultData].extConfig.wechatSessionData.title= [dic objectForKey:@"title"];
//                                                    [UMSocialData defaultData].extConfig.wechatSessionData.shareText= [dic objectForKey:@"content"];
//                                                    [UMSocialData defaultData].extConfig.wechatSessionData.wxMessageType = UMSocialWXMessageTypeWeb;
//                                                    if(error == nil)
//                                                    {
//                                                        [UMSocialData defaultData].extConfig.wechatSessionData.shareImage = image;
//                                                    }
//                                                });
//
//                                            }];
}

RCT_EXPORT_METHOD(setWechatTimelineData:(NSDictionary*)dic)
{
//    RCTImageSource* source = [RCTConvert RCTImageSource:[dic objectForKey:@"imageSource"]];
//    __weak RCTUmengShare *weakSelf = self;
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:source.imageURL.absoluteString]];
//    [self.bridge.imageLoader loadImageWithURLRequest:urlRequest
//                                            callback:^(NSError *error, UIImage *image) {
//                                                if(image == nil)
//                                                {
//                                                    return;
//                                                }
//                                                dispatch_async(dispatch_get_main_queue(), ^{
//                                                    [UMSocialData defaultData].extConfig.wechatTimelineData.url= [[dic objectForKey:@"url"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//                                                    [UMSocialData defaultData].extConfig.wechatTimelineData.title= [dic objectForKey:@"title"];
//                                                    [UMSocialData defaultData].extConfig.wechatTimelineData.shareText= [dic objectForKey:@"content"];
//                                                    [UMSocialData defaultData].extConfig.wechatTimelineData.wxMessageType = UMSocialWXMessageTypeWeb;
//                                                    if(error == nil)
//                                                    {
//                                                        [UMSocialData defaultData].extConfig.wechatTimelineData.shareImage = image;
//                                                    }
//                                                });
//
//                                            }];
}

RCT_EXPORT_METHOD(setWechatFavoriteData:(NSDictionary*)dic)
{
//    RCTImageSource* source = [RCTConvert RCTImageSource:[dic objectForKey:@"imageSource"]];
//    __weak RCTUmengShare *weakSelf = self;
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:source.imageURL.absoluteString]];
//    [self.bridge.imageLoader loadImageWithURLRequest:urlRequest
//                                            callback:^(NSError *error, UIImage *image) {
//                                                if(image == nil)
//                                                {
//                                                    return;
//                                                }
//                                                dispatch_async(dispatch_get_main_queue(), ^{
//                                                    [UMSocialData defaultData].extConfig.wechatFavoriteData.url= [[dic objectForKey:@"url"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//                                                    [UMSocialData defaultData].extConfig.wechatFavoriteData.title= [dic objectForKey:@"title"];
//                                                    [UMSocialData defaultData].extConfig.wechatFavoriteData.shareText= [dic objectForKey:@"content"];
//                                                    [UMSocialData defaultData].extConfig.wechatFavoriteData.wxMessageType = UMSocialWXMessageTypeWeb;
//                                                    if(error == nil)
//                                                    {
//                                                        [UMSocialData defaultData].extConfig.wechatFavoriteData.shareImage = image;
//                                                    }
//                                                });
//
//                                            }];
}

RCT_EXPORT_METHOD(setSinaData:(NSDictionary*)dic)
{
//    RCTImageSource* source = [RCTConvert RCTImageSource:[dic objectForKey:@"imageSource"]];
//    __weak RCTUmengShare *weakSelf = self;
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:source.imageURL.absoluteString]];
//    [self.bridge.imageLoader loadImageWithURLRequest:urlRequest
//                                            callback:^(NSError *error, UIImage *image) {
//                                                if(image == nil)
//                                                {
//                                                    return;
//                                                }
//                                                dispatch_async(dispatch_get_main_queue(), ^{
//                                                    [UMSocialData defaultData].extConfig.sinaData.shareText= [NSString stringWithFormat:@"%@ %@ %@",[dic objectForKey:@"title"],[dic objectForKey:@"content"],[dic objectForKey:@"url"]];
//                                                    if(error == nil)
//                                                    {
//                                                        [UMSocialData defaultData].extConfig.sinaData.shareImage = image;
//                                                    }
//                                                });
//
//                                            }];
}

RCT_EXPORT_METHOD(showShareMenuView:(NSString*)title content:(NSString*)content url:(NSString*)url imageSource:(RCTImageSource*)imageSource)
{
    NSURLRequest *urlRequest = imageSource.request;
    [self.bridge.imageLoader loadImageWithURLRequest:urlRequest
                                            callback:^(NSError *error, UIImage *image) {
                                                UIImage* tempImage = image;
                                                if(error)
                                                {
                                                    tempImage = nil;
                                                }
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    //显示分享面板
                                                    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
                                                        
                                                        //创建分享消息对象
                                                        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
                                                        
                                                        //创建网页内容对象
                                                        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:content thumImage:tempImage];
                                                        //设置网页地址
                                                        shareObject.webpageUrl = url;
                                                        
                                                        //分享消息对象设置分享内容对象
                                                        messageObject.shareObject = shareObject;
                                                        
                                                        //获取当前view controller
                                                        UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
                                                        UIViewController *topVC = appRootVC;
                                                        if (topVC.presentedViewController) {
                                                            topVC = topVC.presentedViewController;  
                                                        }
                                                        
                                                        //调用分享接口
                                                        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:topVC completion:^(id data, NSError *error) {
                                                            if (error) {
                                                                NSLog(@"************Share fail with error %@*********",error);
                                                            }else{
                                                                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                                                                    UMSocialShareResponse *resp = data;
                                                                    //分享结果消息
                                                                    NSLog(@"response message is %@",resp.message);
                                                                    //第三方原始返回的数据
                                                                    NSLog(@"response originalResponse data is %@",resp.originalResponse);
                                                                    
                                                                }else{
                                                                    NSLog(@"response data is %@",data);
                                                                }
                                                            }
                                                            [self alertWithError:error];
                                                        }];
                                                        
                                                    }];

                                                });

                                            }];

}

- (void)alertWithError:(NSError *)error
{
    NSString *result = nil;
    if (!error) {
        result = [NSString stringWithFormat:@"分享成功"];
    }
    else{
        if (error) {
            result = [NSString stringWithFormat:@"分享失败【%@】",[self getErrorString:error.code]];
        }
        else{
            result = [NSString stringWithFormat:@"分享失败"];
        }
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"信息"
                                                    message:result
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"确定", @"确定")
                                          otherButtonTitles:nil];
    [alert show];
}


//http://dev.umeng.com/social/ios/u-share%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98
//UMSocialPlatformErrorType_Unknow            = 2000,            // 未知错误
//UMSocialPlatformErrorType_NotSupport        = 2001,            // 不支持（url scheme 没配置，或者没有配置-ObjC， 或则SDK版本不支持或则客户端版本不支持）
//UMSocialPlatformErrorType_AuthorizeFailed   = 2002,            // 授权失败
//UMSocialPlatformErrorType_ShareFailed       = 2003,            // 分享失败
//UMSocialPlatformErrorType_RequestForUserProfileFailed = 2004,  // 请求用户信息失败
//UMSocialPlatformErrorType_ShareDataNil      = 2005,             // 分享内容为空
//UMSocialPlatformErrorType_ShareDataTypeIllegal = 2006,          // 分享内容不支持
//UMSocialPlatformErrorType_CheckUrlSchemaFail = 2007,            // schemaurl fail
//UMSocialPlatformErrorType_NotInstall        = 2008,             // 应用未安装
//UMSocialPlatformErrorType_Cancel            = 2009,             // 取消操作
//UMSocialPlatformErrorType_NotNetWork        = 2010,             // 网络异常
//UMSocialPlatformErrorType_SourceError       = 2011,             // 第三方错误
//UMSocialPlatformErrorType_ProtocolNotOverride = 2013,   // 对应的    UMSocialPlatformProvider的方法没有实现

- (NSString*)getErrorString:(int) code{
    NSString* ret = @"";
    
    switch(code) {
        case 2000:
            ret = @"未知错误";
            break;
        case 2001:
            ret = @"不支持";
            break;
        case 2002:
            ret = @"授权失败";
            break;
        case 2003:
            ret = @"分享失败";
            break;
        case 2004:
            ret = @"请求用户信息失败";
            break;
        case 2005:
            ret = @"分享内容为空";
            break;
        case 2006:
            ret = @"分享内容不支持";
            break;
        case 2007:
            ret = @"schema url失败";
            break;
        case 2008:
            ret = @"应用未安装";
            break;
        case 2009:
            ret = @"用户取消";
            break;
        case 2010:
            ret = @"网络异常";
            break;
        case 2011:
            ret = @"第三方错误";
            break;
        case 2013:
            ret = @"UMSocialPlatformProvider的方法没有实现";
            break;
        default:
            break;
    }
    
    return ret;
}
@end
