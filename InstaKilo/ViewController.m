//
//  ViewController.m
//  InstaKilo
//
//  Created by Frances ZiyiFan on 5/15/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "ViewController.h"
#import "ImageCollectionViewCell.h"
#import "SectionHeaderCollectionReusableView.h"

@interface ViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray <NSString *> *imageSubject;
@property (strong, nonatomic) NSArray <NSString *> *imageSubject2;
@property (strong, nonatomic) NSArray <NSArray<UIImage *> *> *imageArray;
@property (strong, nonatomic) NSArray <NSArray<UIImage *> *> *imageArray2;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) NSArray <NSArray<UIImage *> *> *currentArray;
@property (assign, nonatomic) int group;
@property (strong, nonatomic) NSArray <NSString *> *currentImageSection;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageSubject = @[@"Avengers",
                          @"Dark Knight"
                        ];
    self.imageSubject2 = @[@"A",
                           @"B",
                           @"C"
                           ];
//    self.imageName = @[@"avg1",
//                       @"avg2",
//                       @"avg3",
//                       @"avg4",
//                       @"avg5",
//                       @"dk1",
//                       @"dk2",
//                       @"dk3",
//                       @"dk4",
//                       @"dk5"
//                       ];
    UIImage *image1 = [UIImage imageNamed:@"avg1"];
    UIImage *image2 = [UIImage imageNamed:@"avg2"];
    UIImage *image3 = [UIImage imageNamed:@"avg3"];
    UIImage *image4 = [UIImage imageNamed:@"avg4"];
    UIImage *image5 = [UIImage imageNamed:@"avg5"];
    UIImage *image6 = [UIImage imageNamed:@"dk1"];
    UIImage *image7 = [UIImage imageNamed:@"dk2"];
    UIImage *image8 = [UIImage imageNamed:@"dk3"];
    UIImage *image9 = [UIImage imageNamed:@"dk4"];
    UIImage *image10 = [UIImage imageNamed:@"dk5"];
    self.imageArray = @[@[image1,
                          image2,
                          image3,
                          image4,
                          image5],
                        @[image6,
                          image7,
                          image8,
                          image9,
                          image10]
                        ];
    self.imageArray2 = @[@[image1,
                           image3,
                           image7],
                         @[image2,
                           image4,
                           image5],
                         @[image6,
                           image8,
                           image9,
                           image10]
                         ];
//    for(int i=0; i <self.imageName ; i++){
//        UIImage *image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", self.imageName[i]]];
//        [self.imageArray addObject:image];
//    }
    self.currentArray = self.imageArray;
    self.currentImageSection = self.imageSubject;
    self.group = 0;
    
}

- (IBAction)switchGrouping:(id)sender {
    if(self.group == 0){
        self.currentArray = self.imageArray2;
        self.currentImageSection = self.imageSubject2;
        self.group = 1;
    }
    else{
        self.currentArray = self.imageArray;
        self.currentImageSection = self.imageSubject;
        self.group = 0;
    }
    [UIView transitionWithView:self.collectionView duration:0.35f options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void){
        [self.collectionView reloadData];
    } completion:nil];
    
}

- (void)imageTapped: (UITapGestureRecognizer *) sender{
    NSLog(@"tapped %@", sender);
}

#pragma UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.currentArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.currentArray[section].count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"image" forIndexPath:indexPath];
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapped:)];
    [cell addGestureRecognizer:tapped];
    [cell addImage:self.currentArray[indexPath.section][indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    SectionHeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SectionHeaderCollectionReusableView" forIndexPath:indexPath];
    
    header.headerLabel.text = self.currentImageSection[indexPath.section];
    header.headerLabel.textColor = [UIColor whiteColor];
    header.backgroundColor = [UIColor blackColor];
    return header;
}

#pragma UICollectionDelegate



@end
