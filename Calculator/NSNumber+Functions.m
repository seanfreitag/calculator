//
// Created by Sean Freitag on 7/31/13.
//


#import "NSNumber+Functions.h"


@implementation NSNumber (Functions)

- (NSNumber *)numberByAdding:(NSNumber *)number {
    return @([self doubleValue] + [number doubleValue]);
}

- (NSNumber *)numberBySubtracting:(NSNumber *)number {
    return @([self doubleValue] - [number doubleValue]);
}

@end