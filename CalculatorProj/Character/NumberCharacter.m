//
//  Number.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/09.
//

#import "NumberCharacter.h"
#import "NumberButtonOperation.h"

@implementation NumberCharacter

-(instancetype) initWithText: (NSString*) aText {
    self = [super initWithText:aText];
    if (self) {
        [self setText:aText];
        [self setButtonOperation: [NumberButtonOperation new]];
    }
    return self;
}

@end
