//
//  ViewController.m
//  PetAdoption
//
//  Created by Andrew Kozlik on 7/9/15.
//  Copyright (c) 2015 Andrew Kozlik. All rights reserved.
//

#import "AnimalListViewController.h"
#import <Parse/Parse.h>

#import "AnimalCollectionViewCell.h"

@interface AnimalListViewController ()

@end

@implementation AnimalListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"City of Lady Lake Animal Servicester", nil);
    
    PFQuery *query = [PFQuery queryWithClassName:@"Animal"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"%@", objects);
    }];

    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    AnimalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AnimalCell" forIndexPath:indexPath];
    
    cell.captionLabel.text = @"Test";
    
    return cell;
}

@end
