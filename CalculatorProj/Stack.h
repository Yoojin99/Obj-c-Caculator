//
//  Stack.h
//  CalculatorProj
//
//  Created by NHN on 2021/04/07.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stack : NSObject

@property NSMutableArray *stack;

-(BOOL) isEmpty;

-(void) push: (id) obj;
-(id) pop;

@end

NS_ASSUME_NONNULL_END
