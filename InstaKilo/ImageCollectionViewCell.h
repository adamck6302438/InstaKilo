//
//  ImageCollectionViewCell.h
//  InstaKilo
//
//  Created by Frances ZiyiFan on 5/15/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

-(void) addImage: (UIImage *)image;

@end

NS_ASSUME_NONNULL_END
