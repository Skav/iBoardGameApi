//
//  NSArray_Reverse.m
//  Sample
//
//  Created by Skav on 4/13/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "NSArray_Reverse.h"

@implementation NSArray (Reverse)

- (NSArray *)reversedArray {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return array;
}

@end
