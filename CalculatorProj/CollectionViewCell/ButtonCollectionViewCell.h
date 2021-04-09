//
//  NumberCollectionViewCell.h
//  CalculatorProj
//
//  Created by NHN on 2021/04/07.
//

#import <UIKit/UIKit.h>
#import "Character.h"

NS_ASSUME_NONNULL_BEGIN

@interface ButtonCollectionViewCell : UICollectionViewCell

@property UILabel* buttonTextLabel;
@property NSString* buttonText;
@property Character* character;

@end

NS_ASSUME_NONNULL_END
