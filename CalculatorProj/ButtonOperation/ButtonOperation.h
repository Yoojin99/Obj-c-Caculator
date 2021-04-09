//
//  ButtonOperation.h
//  CalculatorProj
//
//  Created by NHN on 2021/04/09.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ButtonOperation : NSObject

-(NSString*) buttonPush: (NSString*) aBeforeText withText: (NSString*) aInputText;

@end

NS_ASSUME_NONNULL_END
