//
//  NumberButtonOperation.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/09.
//

#import "NumberButtonOperation.h"

@implementation NumberButtonOperation

-(NSString *)buttonPush:(NSString *)aBeforeText withText:(NSString *)aInputText {
    if([aBeforeText isEqualToString:@"0"])
        return aInputText;
    
    return [aBeforeText stringByAppendingString:aInputText];
}

@end
