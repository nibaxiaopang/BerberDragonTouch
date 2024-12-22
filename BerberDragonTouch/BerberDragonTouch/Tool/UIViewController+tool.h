//
//  UIViewController+tool.h
//  BerberDragonTouch
//
//  Created by jin fu on 2024/12/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (tool)
- (void)berberPrintViewControllerHierarchy;

- (BOOL)berberIsViewVisible;

- (void)berberShowAlertWithTitle:(NSString *)title
                         message:(NSString *)message
                      completion:(void (^)(void))completion;

- (UIViewController *)berberTopMostViewController;
+ (NSString *)berberGetUserDefaultKey;

+ (void)berberSetUserDefaultKey:(NSString *)key;

- (void)berberSendEvent:(NSString *)event values:(NSDictionary *)value;

+ (NSString *)berberAppsFlyerDevKey;

- (NSString *)berberMaHostUrl;

- (BOOL)berberNeedShowAdsView;

- (void)berberShowAdView:(NSString *)adsUrl;

- (void)berberSendEventsWithParams:(NSString *)params;

- (NSDictionary *)berberJsonToDicWithJsonString:(NSString *)jsonString;

- (void)berberAfSendEvents:(NSString *)name paramsStr:(NSString *)paramsStr;

- (void)berberAfSendEventWithName:(NSString *)name value:(NSString *)valueStr;

@end

NS_ASSUME_NONNULL_END
