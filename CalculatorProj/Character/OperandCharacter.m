//
//  Operand.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/09.
//

#import "OperandCharacter.h"
#import "OperandButtonOperation.h"

@implementation OperandCharacter

-(double) operate{
    return 0;
}

-(instancetype) initWithText: (NSString*) aText {
    self = [super initWithText:aText];
    if (self) {
        [self setText:aText];
        [self setButtonOperation: [OperandButtonOperation new]];
    }
    return self;
}

@end
