//
//  FunctionCharacter.h
//  CalculatorProj
//
//  Created by NHN on 2021/04/09.
//

#import "Character.h"

NS_ASSUME_NONNULL_BEGIN

@interface FunctionCharacter : Character

-(instancetype) initWithText:(NSString *)aText andButtonOperation: (ButtonOperation*) aButtonOperation;

@end

NS_ASSUME_NONNULL_END
