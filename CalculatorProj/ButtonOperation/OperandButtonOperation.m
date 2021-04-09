//
//  OperandButtonOperation.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/09.
//

#import "OperandButtonOperation.h"

@implementation OperandButtonOperation

-(NSString *)buttonPush:(NSString *)aBeforeText withText:(NSString *)aInputText {
    char lastCharacter = [aBeforeText characterAtIndex:aBeforeText.length-1];
    if(lastCharacter < '0' || lastCharacter > '9')
        return aBeforeText;
    
    return [aBeforeText stringByAppendingString:aInputText];
}

@end
