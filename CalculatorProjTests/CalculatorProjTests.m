//
//  CalculatorProjTests.m
//  CalculatorProjTests
//
//  Created by NHN on 2021/04/05.
//

#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface CalculatorProjTests : XCTestCase

@property Calculator* calculator;

@end

@implementation CalculatorProjTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    Calculator* sCalculator = [[Calculator alloc] init];
    self.calculator = sCalculator;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.calculator add:10];
    XCTAssertTrue(self.calculator.accumulator == 10);
}

-(void)testMinus {
    [self.calculator subtract:10];
    XCTAssertTrue(self.calculator.accumulator == -10);
}

-(void)testMulti {
    [self.calculator subtract:10];
    XCTAssertTrue(self.calculator.accumulator == 0);
}

-(void)testDivideSuccess {
    [self.calculator divide:10];
    XCTAssertTrue(self.calculator.accumulator == 0);
}

-(void)testDivideWithZero {
    XCTAssertThrows([self.calculator divide:0], @"");
}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
