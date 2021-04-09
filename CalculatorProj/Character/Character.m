//
//  Character.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/09.
//

#import "Character.h"

@implementation Character

-(instancetype) initWithText: (NSString*) aText {
    self = [super init];
    if (self) {
        [self setText:aText];
    }
    return self;
}

-(instancetype) init {
    return [self initWithText:@""];
}

@end
