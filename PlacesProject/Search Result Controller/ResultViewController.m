//
//  ResultViewController.m
//  PlacesProject
//
//  Created by Mohamed El Hanafi on 04/10/2018.
//  Copyright © 2018 Mohamed El Hanafi. All rights reserved.
//

#import "ResultViewController.h"
#import <GooglePlaces/GooglePlaces.h>
@interface ResultViewController ()<GMSAutocompleteResultsViewControllerDelegate>
@property (nonatomic) GMSAutocompleteResultsViewController* resultsViewController;
@property (nonatomic) UISearchController* searchController;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _resultsViewController = [[GMSAutocompleteResultsViewController alloc] init];
    _resultsViewController.delegate = self;
    
    _searchController = [[UISearchController alloc]
                         initWithSearchResultsController:_resultsViewController];
    _searchController.searchResultsUpdater = _resultsViewController;
    
    [self addTheSearchToNavigationBar:true];
    
    // When UISearchController presents the results view, present it in
    // this view controller, not one further up the chain.
    self.definesPresentationContext = YES;
    
    // Prevent the navigation bar from being hidden when searching.
    _searchController.hidesNavigationBarDuringPresentation = NO;
    
    
    /*self.navigationController.navigationBar.translucent = NO;
    _searchController.hidesNavigationBarDuringPresentation = NO;
    
    // This makes the view area include the nav bar even though it is opaque.
    // Adjust the view placement down.
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeTop;*/
}

#pragma MARK
-(void)addTheSearchToNavigationBar:(BOOL)titleView{
    if (titleView) {
        // Put the search bar in the navigation bar.
        [_searchController.searchBar sizeToFit];
        self.navigationItem.titleView = _searchController.searchBar;
    }else{
        UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 65.0, 250, 50)];
        
        [subView addSubview:_searchController.searchBar];
        [_searchController.searchBar sizeToFit];
        [self.view addSubview:subView];
        
        self.navigationController.navigationBar.translucent = NO;
        _searchController.hidesNavigationBarDuringPresentation = NO;
        
        // This makes the view area include the nav bar even though it is opaque.
        // Adjust the view placement down.
        self.extendedLayoutIncludesOpaqueBars = YES;
        self.edgesForExtendedLayout = UIRectEdgeTop;
    }
}

// Handle the user's selection.
- (void)resultsController:(GMSAutocompleteResultsViewController *)resultsController
 didAutocompleteWithPlace:(GMSPlace *)place {
    _searchController.active = NO;
    // Do something with the selected place.
    NSLog(@"Place name %@", place.name);
    NSLog(@"Place address %@", place.formattedAddress);
    NSLog(@"Place attributions %@", place.attributions.string);
    
    self.resultLabel.text = [NSString stringWithFormat:@"name :%@ / address :%@",place.name,place.formattedAddress];
}

- (void)resultsController:(GMSAutocompleteResultsViewController *)resultsController
didFailAutocompleteWithError:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
    // TODO: handle the error.
    NSLog(@"Error: %@", [error description]);
}

// Turn the network activity indicator on and off again.
- (void)didRequestAutocompletePredictionsForResultsController:
(GMSAutocompleteResultsViewController *)resultsController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didUpdateAutocompletePredictionsForResultsController:
(GMSAutocompleteResultsViewController *)resultsController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
@end
