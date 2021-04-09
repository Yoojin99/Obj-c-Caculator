//
//  Calculator.h
//  CalculatorProj
//
//  Created by NHN on 2021/04/05.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject

@property double accumulator;

-(double) add: (double) value1 with: (double) value2;
-(double) subtract: (double) value1 with: (double) value2;
-(double) multiply: (double) value1 with: (double) value2;
-(double) divide: (double) value1 with: (double) value2;

@end

NS_ASSUME_NONNULL_END
