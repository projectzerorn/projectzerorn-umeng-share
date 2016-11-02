

#import "RCTUmengShare.h"
#import "RCTConvert.h"
#import "RCTImageLoader.h"
#import "RCTImageSource.h"
#import "RCTConvert.h"
#import <UMSocialCore/UMSocialCore.h>
#import "UMSocialUIManager.h"

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
    self.umengAppKey = appKey;
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:appKey];
}

RCT_EXPORT_METHOD(setWXAppId:(NSString*)appId appSecret:(NSString*)appSecret url:(NSString*)url)
{
//    [UMSocialWechatHandler setWXAppId:appId appSecret:appSecret url:url];
}

RCT_EXPORT_METHOD(setQQWithAppId:(NSString*)appId appKey:(NSString*)appKey url:(NSString*)url supportWebView:(BOOL)supportWebView)
{
//    [UMSocialQQHandler setQQWithAppId:appId appKey:appKey url:url];
//    [UMSocialQQHandler setSupportWebView:supportWebView];
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

RCT_EXPORT_METHOD(showShareMenuView:(NSString*)title content:(NSString*)content imageSource:(RCTImageSource*)imageSource)
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
                                                    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMShareMenuSelectionView *shareSelectionView, UMSocialPlatformType platformType) {
                                                        
                                                        //创建分享消息对象
                                                        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
                                                        
                                                        //创建网页内容对象
                                                        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"分享标题" descr:@"分享内容描述" thumImage:[UIImage imageNamed:@"icon"]];
                                                        //设置网页地址
                                                        shareObject.webpageUrl =@"http://mobile.umeng.com/social";
                                                        
                                                        //分享消息对象设置分享内容对象
                                                        messageObject.shareObject = shareObject;
                                                        
                                                        //调用分享接口
                                                        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
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
        result = [NSString stringWithFormat:@"Share succeed"];
    }
    else{
        if (error) {
            result = [NSString stringWithFormat:@"Share fail with error code: %d\n",(int)error.code];
        }
        else{
            result = [NSString stringWithFormat:@"Share fail"];
        }
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share"
                                                    message:result
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"sure", @"确定")
                                          otherButtonTitles:nil];
    [alert show];
}
@end
