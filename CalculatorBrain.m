//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Sheena Deutsch on 7/11/13.
//  Copyright (c) 2013 Sheena Deutsch. All rights reserved.
//

#import "CalculatorBrain.h"
#import "NSNumber+Functions.h"


@interface CalculatorBrain ()

@property (nonatomic, strong) NSMutableArray *operands;

@end

@implementation CalculatorBrain

- (NSMutableArray *)operands {
    if (_operands == nil)
        _operands = [NSMutableArray array];
    return _operands;
}

- (void)pushOperand:(NSString *)operand {
    [self.operands addObject:[NSDecimalNumber decimalNumberWithString:operand]];
}

- (NSNumber *)performOperation:(NSString *)operation {
    NSNumber *number = @(0);

    if        ([operation isEqualToString:@"+"])    {
        for (NSNumber *operand in self.operands)
            number = [number numberByAdding:operand];
    } else if ([operation isEqualToString:@"-"])    {
        for (NSNumber *operand in self.operands)
            number = [number numberBySubtracting:operand];
    } else if ([operation isEqualToString:@"*"])    {

    } else if ([operation isEqualToString:@"/"])    {

    } else if ([operation isEqualToString:@"sin"])  {

    } else if ([operation isEqualToString:@"cos"])  {

    } else if ([operation isEqualToString:@"sqrt"]) {

    } else {
        [NSException raise:@"InvalidOperationException" format:@"Hey dummy, %@ is not a valid operation", operation];
    }

    [self emptyStack];

    [self.operands addObject:number];

    return number;
}

- (void)emptyStack {
    [self.operands removeAllObjects];
}

@end
