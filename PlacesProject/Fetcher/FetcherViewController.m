//
//  FetcherViewController.m
//  PlacesProject
//
//  Created by Mohamed El Hanafi on 04/10/2018.
//  Copyright © 2018 Mohamed El Hanafi. All rights reserved.
//

#import "FetcherViewController.h"
#import <GooglePlaces/GooglePlaces.h>
@interface FetcherViewController ()<GMSAutocompleteFetcherDelegate,UISearchDisplayDelegate>
{
    GMSAutocompleteFetcher* _fetcher;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation FetcherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Set bounds to inner-west Sydney Australia.
    CLLocationCoordinate2D neBoundsCorner = CLLocationCoordinate2DMake(-33.843366, 151.134002);
    CLLocationCoordinate2D swBoundsCorner = CLLocationCoordinate2DMake(-33.875725, 151.200349);
    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] initWithCoordinate:neBoundsCorner coordinate:swBoundsCorner];
    
    // Set up the autocomplete filter.
    GMSAutocompleteFilter *filter = [[GMSAutocompleteFilter alloc] init];
    filter.type = kGMSPlacesAutocompleteTypeFilterNoFilter;
    //kGMSPlacesAutocompleteTypeFilterEstablishment;
    
    // Create the fetcher.
    _fetcher = [[GMSAutocompleteFetcher alloc] initWithBounds:bounds
                                                       filter:filter];
    _fetcher.delegate = self;
    _searchBar.delegate = self;
}
- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText{
    [_fetcher sourceTextHasChanged:searchBar.text];
}
#pragma mark - GMSAutocompleteFetcherDelegate
- (void)didAutocompleteWithPredictions:(NSArray *)predictions {
    NSMutableString *resultsStr = [NSMutableString string];
    for (GMSAutocompletePrediction *prediction in predictions) {
        [resultsStr appendFormat:@"%@\n", [prediction.attributedPrimaryText string]];
    }
    _resultLabel.text = resultsStr;
}

- (void)didFailAutocompleteWithError:(NSError *)error {
    _resultLabel.text = [NSString stringWithFormat:@"%@", error.localizedDescription];
}
@end
