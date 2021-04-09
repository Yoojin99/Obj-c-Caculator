//
//  NumberCollectionViewCell.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/07.
//

#import "ButtonCollectionViewCell.h"

@implementation ButtonCollectionViewCell {
    //UILabel* buttonTextLabel;
}

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _buttonTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _buttonTextLabel.textColor = UIColor.blackColor;
        _buttonTextLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
        //_buttonTextLabel.text = @"1";
        
        [self.contentView addSubview:_buttonTextLabel];
        _buttonTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints: @[
            [_buttonTextLabel.centerXAnchor constraintEqualToAnchor: self.contentView.centerXAnchor],
            [_buttonTextLabel.centerYAnchor constraintEqualToAnchor: self.contentView.centerYAnchor],
        ]];
    }
    return self;
}
// 2
//- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
//    UICollectionViewLayoutAttributes* sLayoutAttribute = [super preferredLayoutAttributesFittingAttributes: layoutAttributes];
//    sLayoutAttribute.frame = CGRectMake(sLayoutAttribute.frame.origin.x, sLayoutAttribute.frame.origin.y, 100, 100);
//    return sLayoutAttribute;
//}

@end
