//
//  FunctionCharacter.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/09.
//

#import "FunctionCharacter.h"

@implementation FunctionCharacter

-(instancetype) initWithText:(NSString *)aText andButtonOperation: (ButtonOperation*) aButtonOperation {
    self = [super initWithText:aText];
    if (self) {
        [self setButtonOperation:aButtonOperation];
    }
    return self;
}

@end
