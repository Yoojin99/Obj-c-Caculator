//
//  Stack.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/07.
//

#import "Stack.h"

@implementation Stack

-(instancetype) init {
    self = [super init];
    if (self) {
        _stack = [NSMutableArray new];
    }
    return self;
}

-(void) push: (id) element{
    [_stack addObject: element];
}

-(BOOL) isEmpty {
    return _stack.count == 0;
}

-(id) pop {
    id obj = [_stack lastObject];
    [_stack removeLastObject];
    return obj;
}

@end
