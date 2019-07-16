//
//  CustomSearchViewController.m
//  PlacesProject
//
//  Created by Mohamed El Hanafi on 04/10/2018.
//  Copyright © 2018 Mohamed El Hanafi. All rights reserved.
//

#import "CustomSearchViewController.h"

@interface CustomSearchViewController ()<UISearchResultsUpdating>
@property (nonatomic) UISearchController* searchController;
@end

@implementation CustomSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    
    _searchController.searchResultsUpdater = self;
    _searchController.obscuresBackgroundDuringPresentation = false;
    _searchController.searchBar.placeholder = @"Search Candies";
    self.navigationItem.searchController = _searchController;
    self.definesPresentationContext = true;
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
}
@end
