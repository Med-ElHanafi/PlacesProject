//
//  TableDataViewController.m
//  PlacesProject
//
//  Created by Mohamed El Hanafi on 04/10/2018.
//  Copyright © 2018 Mohamed El Hanafi. All rights reserved.
//

#import "TableDataViewController.h"
#import <GooglePlaces/GooglePlaces.h>
@interface TableDataViewController ()<GMSAutocompleteTableDataSourceDelegate,UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) GMSAutocompleteTableDataSource* tableDataSource;
@property (nonatomic) UISearchDisplayController* searchDisplayController;
@end

@implementation TableDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //_searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, 250.0f, 44.0f)];
    
    _tableDataSource = [[GMSAutocompleteTableDataSource alloc] init];
    _tableDataSource.delegate = self;
    
    _searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar
                                                                 contentsController:self];
    _searchDisplayController.searchResultsDataSource = _tableDataSource;
    _searchDisplayController.searchResultsDelegate = _tableDataSource;
    _searchDisplayController.delegate = self;
    
    //[self.view addSubview:_searchBar];
}
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [_tableDataSource sourceTextHasChanged:searchString];
    return NO;
}
// Handle the user's selection.
- (void)tableDataSource:(GMSAutocompleteTableDataSource *)tableDataSource
didAutocompleteWithPlace:(GMSPlace *)place {
    [_searchDisplayController setActive:NO animated:YES];
    // Do something with the selected place.
    NSLog(@"Place name %@", place.name);
    NSLog(@"Place address %@", place.formattedAddress);
    NSLog(@"Place attributions %@", place.attributions.string);
}

- (void)tableDataSource:(GMSAutocompleteTableDataSource *)tableDataSource
didFailAutocompleteWithError:(NSError *)error {
    [_searchDisplayController setActive:NO animated:YES];
    // TODO: handle the error.
    NSLog(@"Error: %@", [error description]);
}

- (void)didUpdateAutocompletePredictionsForTableDataSource:
(GMSAutocompleteTableDataSource *)tableDataSource {
    // Turn the network activity indicator off.
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    // Reload table data.
    [_searchDisplayController.searchResultsTableView reloadData];
}

- (void)didRequestAutocompletePredictionsForTableDataSource:
(GMSAutocompleteTableDataSource *)tableDataSource {
    // Turn the network activity indicator on.
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    // Reload table data.
    [_searchDisplayController.searchResultsTableView reloadData];
}
@end
