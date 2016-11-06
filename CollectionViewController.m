//
//  CollectionViewController.m
//  LogFood
//
//  Created by Harshil Parikh on 2016-11-05.
//  Copyright © 2016 UW. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "ViewController.h"

@interface CollectionViewController (){
    NSArray *arrayImages;
    NSInteger *index;
}

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self collectionView]setDataSource:self];
    [[self collectionView]setDelegate:self];

    arrayImages = [[NSArray alloc]initWithObjects:@"OrangeJuice.png", @"Milk.png", @"Banana.png", @"Bacon.png", @"Pizza-Slice.png", @"BeefSteakTomato.png", @"BreakfastSausage.png", @"Broccoli.png", @"Carrots.png", @"Cereal.png", @"CheddarCheese.png", @"Chicken.png", @"ChickenNoodleSoup.png", @"Chickpeas.png", @"Egg.png", @"Couscous.png", @"Gourmet-Burger.png", @"GreenPepper.png", @"Hummus.png", @"ItalianBread.png", @"Muffin.png", @"Oatmeal.png", @"Pancake.png", @"PlainBagel.png", @"PeanutButter.png", @"RedPepper.png", @"Rice.png", @"Salmon.png", @"Spinach.png", @"Tofu.png", @"Pasta.png", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayImages count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [[cell imageCell]setImage:[UIImage imageNamed:[arrayImages objectAtIndex:indexPath.item]]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //[eatenToday addObject:[arrayImages objectAtIndex:indexPath.item]];
    index = indexPath.item;
    [self performSegueWithIdentifier:@"goBack" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"goBack"]) {
        ViewController *photo = [segue destinationViewController];
        photo.image = [arrayImages objectAtIndex:index];
        //photo.image = [arrayImages objectAtIndex:index];
        //photo.number = 1;
        index = nil;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
