//
//  Calculator.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/05.
//

#import "Calculator.h"

@implementation Calculator

@synthesize accumulator;

-(double) add: (double) value1 with: (double) value2 {
    return value1 + value2;
}
-(double) subtract: (double) value1 with: (double) value2 {
    return value1 - value2;
}
-(double) multiply: (double) value1 with: (double) value2 {
    return value1 * value2;
}
-(double) divide: (double) value1 with: (double) value2 {
    return value1 / value2;
}

////int calculator(int argc, char *argv[]) {
//    @autoreleasepool {
//        double value1, value2;
//        char operator;
//        Calculator *deskCalc = [[Calculator alloc] init];
//
//        NSLog(@"Type in your expression");
//        scanf("%lf %c %lf", &value1, &operator, &value2);
//
//        [deskCalc setAccumulator: value1];
//
//        if (operator == '+')
//            [deskCalc add: value2];
//        else if (operator == '-')
//            [deskCalc subtract:value2];
//        else if (operator == '*')
//            [deskCalc multiply:value2];
//        else if (operator == '/') {
//            if (value2 == 0)
//                NSLog(@"Division by zero");
//            else
//                [deskCalc divide:value2];
//        }
//        else
//            NSLog(@"%.2f", [deskCalc accumulator]);
//    }
//    return 0;
//}
@end
