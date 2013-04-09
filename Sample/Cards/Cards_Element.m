//
//  Cards_Element.m
//  Sample
//
//  Created by Skav on 4/8/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "Cards_Element.h"

@implementation Cards_Element
@synthesize sCardId;

-(id)initWithElementId:(NSString *)_sElementId andCardId:(NSString *)_sCardId{
    self = [super initWithElementId:_sElementId];
    if (self){
        self.sCardId = _sCardId;
    }
    return self;
}
@end
