//
//  ViewController.m
//  LogFood
//
//  Created by Mei Kai Koh on 5/11/16.
//  Copyright © 2016 UW. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCellEaten.h"

@interface ViewController (){
    NSMutableArray *yourArray;
    NSArray *ingredients, *recipes;
    double totalCarb, totalProtein, totalFat;
    double percentCarb, percentProtein, percentFat;
    double targetCarb, targetFat, targetProtein;
    double changeCarb, changeFat, changeProtein;
}

@end

@implementation ViewController
@synthesize recipeImage, image;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[self collectionView]setDataSource:self];
    [[self collectionView]setDelegate:self];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5f
                                             target:self
                                           selector:@selector(showTime)
                                           userInfo:NULL
                                            repeats:YES];
    
    // Category Food Carbs Protein Fats Calories
    ingredients =
    [NSArray arrayWithObjects:
     [NSArray arrayWithObjects:@"Breakfast", @"OrangeJuice", @"26", @"2", @"1", @"110", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"Milk", @"12", @"8", @"8", @"150", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"Cereal", @"33", @"9", @"5", @"20", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"Bacon", @"1", @"5", @"7", @"80", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"Oatmeal", @"13", @"2", @"1", @"72", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"Pancake", @"40", @"5", @"3", @"200", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"Muffin", @"20", @"3", @"10", @"200", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"Banana", @"23", @"1", @"0", @"90", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"BreakfastSausage", @"3", @"5", @"14", @"150", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"ItalianBread", @"14", @"2", @"1", @"77", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"PlainBagel", @"48", @"5", @"2", @"245", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"Egg", @"0", @"8", @"5", @"72", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"PeanutButter", @"8", @"7", @"16", @"190", nil],
     [NSArray arrayWithObjects:@"Breakfast", @"Jam", @"8", @"0", @"0", @"30", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Spinach", @"3", @"2", @"0", @"20", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"ChickenNoodleSoup", @"7", @"7", @"3", @"79", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Rice", @"35", @"3", @"0", @"150", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Chicken", @"1", @"21", @"3", @"120", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Pizza-Slice", @"35", @"13", @"12", @"300", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"BeafsteakTomato", @"0", @"23", @"8", @"200", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Gourmet-Burger", @"3", @"22", @"12", @"200", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"BeefsteakTomato", @"5", @"1", @"0", @"25", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"RedPepper", @"9", @"1", @"0", @"46", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"GreenPepper", @"7", @"0", @"8", @"30", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Carrots", @"8", @"1", @"0", @"35", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Hummus", @"6", @"3", @"4", @"70", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Broccoli", @"0", @"0", @"0", @"31", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Chickpeas", @"17", @"5", @"2", @"100", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Salmon", @"0", @"24", @"10", @"200", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Tofu", @"1", @"10", @"7", @"60", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"CheddarCheese", @"0", @"7", @"10", @"115", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Couscous", @"36", @"6", @"0", @"176", nil],
     [NSArray arrayWithObjects:@"Lunch/Dinner", @"Pasta", @"42", @"7", @"1", @"200", nil], nil];
    
    /*recipes =
     [NSArray arrayWithObjects:
     [NSArray arrayWithObjects:@"Cereal", @"71", @"19", @"14", nil],
     [NSArray arrayWithObjects:@"PBJ Oatmeal", @"29", @"9", @"17", nil],
     [NSArray arrayWithObjects:@"Soup Lunch", @"31", @"17", @"12", nil],
     [NSArray arrayWithObjects:@"Bunless Burger", @"5", @"15", @"20", nil], nil];*/
    
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    static dispatch_once_t once;
    
    dispatch_once(&once, ^ {
        
        // run once code goes here
        [userDefaults setObject:[[NSMutableArray alloc] init] forKey:@"1"];
    });
    
    
    yourArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"1"] mutableCopy];
    
    CGRect collectionFrame = [self.collectionView frame];
    
    if (image != nil){
        CGRect collectionFrame = [self.collectionView frame];
        [self.collectionView setFrame:CGRectMake(collectionFrame.origin.x,
                                                 collectionFrame.origin.y,
                                                 collectionFrame.size.width,
                                                 collectionFrame.size.height + 110*([yourArray count]-[yourArray count]%3)/3)];
        
        
        CGRect labelFrame = [timeLabel frame];
        [timeLabel setFrame:CGRectMake(labelFrame.origin.x, labelFrame.origin.y+110*([yourArray count]-[yourArray count]%3)/3+110, labelFrame.size.width, labelFrame.size.height)];
        CGRect backFrame = [_timeBack frame];
        [_timeBack setFrame:CGRectMake(backFrame.origin.x, backFrame.origin.y+110*([yourArray count]-[yourArray count]%3)/3+110, backFrame.size.width, backFrame.size.height)];
        
        
        [yourArray addObject:image];
    }
    
    else if ([yourArray count] > 0){
        CGRect collectionFrame = [self.collectionView frame];
        [self.collectionView setFrame:CGRectMake(collectionFrame.origin.x,
                                                 collectionFrame.origin.y,
                                                 collectionFrame.size.width,
                                                 collectionFrame.size.height + 110*([yourArray count]-[yourArray count]%3)/3)];
        
        
        CGRect labelFrame = [timeLabel frame];
        [timeLabel setFrame:CGRectMake(labelFrame.origin.x, labelFrame.origin.y+110*([yourArray count]-[yourArray count]%3)/3+110, labelFrame.size.width, labelFrame.size.height)];
        CGRect backFrame = [_timeBack frame];
        [_timeBack setFrame:CGRectMake(backFrame.origin.x, backFrame.origin.y+110*([yourArray count]-[yourArray count]%3)/3+110, backFrame.size.width, backFrame.size.height)];
    }
    
    [userDefaults setObject:yourArray forKey:@"1"];
    
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"calorie"]);
    
    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"calorie"] >= 0){
        int totalCal = [[[NSUserDefaults standardUserDefaults] stringForKey:@"calorie"] intValue];
        totalCarb = (totalCal * 0.4)/4;
        totalProtein = (totalCal * 0.3)/4;
        totalFat = (totalCal * 0.3)/8;
    }
    
    int carbIntake =0, fatIntake=0, proteinIntake = 0;
    for (int i = 0; i < [yourArray count]; i++){
        NSString *indexString = [yourArray objectAtIndex:i];
        for (int j = 0; j < [ingredients count]; j++){
            if ([indexString isEqualToString: [ingredients[j][1] stringByAppendingString:@".png"]]){
                carbIntake += [ingredients[j][2] intValue];
                fatIntake += [ingredients[j][4] intValue];
                proteinIntake += [ingredients[j][3] intValue];
            }
        }
    }
    
    //Find BREAKFAST SCOREEE
    
    
    
    percentCarb = carbIntake / totalCarb;
    percentFat = fatIntake / totalFat;
    percentProtein = proteinIntake / totalProtein;
    
    _carbLabel.text = [@"Carbohydrate: " stringByAppendingString:[[NSString stringWithFormat:@"%g", percentCarb*100] stringByAppendingString:@"%"]];
    _proteinLabel.text = [@"Protein: " stringByAppendingString:[[NSString stringWithFormat:@"%g", percentProtein*100] stringByAppendingString:@"%"]];
    _fatLabel.text = [@"Fat :" stringByAppendingString:[[NSString stringWithFormat:@"%g", percentFat*100] stringByAppendingString:@"%"]];
    
    targetFat = percentFat;
    targetCarb = percentCarb;
    targetProtein = percentProtein;
    
    
    NSMutableArray *smallestChange = [[NSMutableArray alloc] init];
    for (int i =0; i < [ingredients count]; i++){
        changeCarb = fabs(targetCarb - [[[ingredients objectAtIndex:i] objectAtIndex:2] intValue] / totalCarb);
        changeFat = fabs(targetFat - [[[ingredients objectAtIndex:i] objectAtIndex:4] intValue] / totalFat);
        changeProtein = fabs(targetProtein - [[[ingredients objectAtIndex:i] objectAtIndex:3] intValue] / totalProtein);
        double totalChange = changeCarb+changeFat+changeProtein;
        NSLog(@"%f", totalChange);
        [smallestChange addObject:[NSString stringWithFormat:@"%g", totalChange]];
    }
    
    double smallestNum = [[smallestChange objectAtIndex:0] doubleValue];
    int index = 0;
    for (int i = 0; i < [smallestChange count]; i++){
        if ([[smallestChange objectAtIndex:i] doubleValue] < smallestNum){
            index = i;
            smallestNum = [[smallestChange objectAtIndex:i] doubleValue];
        }
    }
    
    //NSLog(@"%@", @"BEst product is");
    NSLog(@"%@", [[ingredients objectAtIndex:index] objectAtIndex:1]);
    _shouldEat.image = [UIImage imageNamed:[[[ingredients objectAtIndex:index] objectAtIndex:1] stringByAppendingString:@".png"]];
    
    
    image = nil;
}

- (void)showTime{
    NSDate *now=[NSDate date];
    NSDateFormatter *dateFormatter=[NSDateFormatter new];
    [dateFormatter setDateFormat:@"HH:mm"];
    timeLabel.text=[dateFormatter stringFromDate:now];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [yourArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Area";
    CollectionViewCellEaten *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [[cell eatImage]setImage:[UIImage imageNamed:[yourArray objectAtIndex:indexPath.item]]];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddPage:(id)sender {
}
- (IBAction)SettingsPage:(id)sender {
}

@end
