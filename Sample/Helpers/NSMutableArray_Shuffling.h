//
//  NSArray_Shuffling.h
//  Sample
//
//  Created by Skav on 4/8/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//
// Credit : http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray
//  NSMutableArray_Shuffling.h

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#include <Cocoa/Cocoa.h>
#endif

// This category enhances NSMutableArray by providing
// methods to randomly shuffle the elements.
@interface NSMutableArray (Shuffling)
- (void)shuffle;
@end