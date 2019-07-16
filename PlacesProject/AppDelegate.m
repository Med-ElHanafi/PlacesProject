//
//  AppDelegate.m
//  PlacesProject
//
//  Created by Mohamed El Hanafi on 04/10/2018.
//  Copyright © 2018 Mohamed El Hanafi. All rights reserved.
//

#import "AppDelegate.h"
@import GooglePlaces;
@import GoogleMaps;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //AIzaSyDHEtkbk1-GkQ0zuAbYuxvV97CCP-zmAqM
    [GMSPlacesClient provideAPIKey:@"AIzaSyCjCN5-spqlFJxxoTNVcgVjbSqSJTCR0Cc"];
    [GMSServices provideAPIKey:@"AIzaSyCjCN5-spqlFJxxoTNVcgVjbSqSJTCR0Cc"];
    
    // Define some colors.
    /*UIColor *darkGray = [UIColor redColor];
    UIColor *lightGray = [UIColor yellowColor];
    
    // Navigation bar background.
    [[UINavigationBar appearance] setBarTintColor:darkGray];
    [[UINavigationBar appearance] setTintColor:lightGray];
    
    // Color of typed text in the search bar.
    NSDictionary *searchBarTextAttributes = @{
                                              NSForegroundColorAttributeName: lightGray,
                                              NSFontAttributeName : [UIFont systemFontOfSize:[UIFont systemFontSize]]
                                              };
    [UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]]
    .defaultTextAttributes = searchBarTextAttributes;
    
    // Color of the placeholder text in the search bar prior to text entry.
    NSDictionary *placeholderAttributes = @{
                                            NSForegroundColorAttributeName: lightGray,
                                            NSFontAttributeName : [UIFont systemFontOfSize:[UIFont systemFontSize]]
                                            };
    
    // Color of the default search text.
    // NOTE: In a production scenario, "Search" would be a localized string.
    NSAttributedString *attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Search"
                                    attributes:placeholderAttributes];
    [UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]]
    .attributedPlaceholder = attributedPlaceholder;
    
    // Color of the in-progress spinner.
    [[UIActivityIndicatorView appearance] setColor:lightGray];
    
    // To style the two image icons in the search bar (the magnifying glass
    // icon and the 'clear text' icon), replace them with different images.
    [[UISearchBar appearance] setImage:[UIImage imageNamed:@"custom_clear_x_high"]
                      forSearchBarIcon:UISearchBarIconClear
                                 state:UIControlStateHighlighted];
    [[UISearchBar appearance] setImage:[UIImage imageNamed:@"custom_clear_x"]
                      forSearchBarIcon:UISearchBarIconClear
                                 state:UIControlStateNormal];
    [[UISearchBar appearance] setImage:[UIImage imageNamed:@"custom_search"]
                      forSearchBarIcon:UISearchBarIconSearch
                                 state:UIControlStateNormal];
    
    // Color of selected table cells.
    UIView *selectedBackgroundView = [[UIView alloc] init];
    selectedBackgroundView.backgroundColor = [UIColor lightGrayColor];
    [UITableViewCell appearanceWhenContainedIn:[GMSAutocompleteViewController class], nil]
    .selectedBackgroundView = selectedBackgroundView;*/
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
