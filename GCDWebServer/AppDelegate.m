//
//  AppDelegate.m
//  GCDWebServer
//
//  Created by Mahaboobsab Nadaf on 01/04/17.
//  Copyright © 2017 Meheboob Nadaf. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (){
    GCDWebServer* _webServer;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Create server
    _webServer = [[GCDWebServer alloc] init];
    
    // Add a handler to respond to GET requests on any URL
    [_webServer addDefaultHandlerForMethod:@"GET"
                              requestClass:[GCDWebServerRequest class]
                              processBlock:^GCDWebServerResponse *(GCDWebServerRequest* request) {
                                  
                                  return [GCDWebServerDataResponse responseWithHTML:@"<html><body><input type='file' accept='image/*' capture='camera'></body></html>"];
                                  
                              }];
    
    // Start server on port 8080
    [_webServer startWithPort:8080 bonjourName:nil];
    NSLog(@"Visit %@ in your web browser", _webServer.serverURL);
    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDir = [paths firstObject];
//    NSString* filename = @"AllPasswords";
//    NSString *filePath = [NSString stringWithFormat:@"%@/%@.txt", documentsDir, filename];
//    
//    NSData*data = [NSKeyedArchiver archivedDataWithRootObject:@"Hello World"];
//    [data writeToFile:filePath atomically:NO];
//    
//    // using `absoluteString` is adding "file://" in front of the path. This seems to be wrong. The following code will create a correct path string.
//    const char *path = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] fileSystemRepresentation];
//    NSString *documents = [[NSFileManager defaultManager] stringWithFileSystemRepresentation:path length:strlen(path)];
//    
//    // full path to the HTML file
//    NSString *htmlFile = [documents stringByAppendingPathComponent:filePath];
//    
//    // "directoryPath" has to be the path to folder with the (main) HTML, not the subfolder of the files. I have a separate folder only for the static files. GCDWebServer will search for the files by it's self - recursive.
//    [_webServer addGETHandlerForBasePath:@"/" directoryPath: documents indexFilename:htmlFile cacheAge:0 allowRangeRequests:YES];
//    
//        [_webServer startWithPort:8080 bonjourName:nil];
//        NSLog(@"Visit %@ in your web browser", _webServer.serverURL);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
