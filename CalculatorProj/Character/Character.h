//
//  Character.h
//  CalculatorProj
//
//  Created by NHN on 2021/04/09.
//

#import <Foundation/Foundation.h>
#import "ButtonOperation.h"

NS_ASSUME_NONNULL_BEGIN

@interface Character : NSObject

@property NSString* text;
@property ButtonOperation* buttonOperation;

-(instancetype) initWithText: (NSString*) aText NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
