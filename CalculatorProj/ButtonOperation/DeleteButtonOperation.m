//
//  DeleteButtonOperation.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/09.
//

#import "DeleteButtonOperation.h"

@implementation DeleteButtonOperation

-(NSString *)buttonPush:(NSString *)aBeforeText withText:(NSString *)aInputText {
    if ([aBeforeText length] == 1)
        return @"0";
    
    return [aBeforeText substringToIndex:(aBeforeText.length - 1)];
}

@end
