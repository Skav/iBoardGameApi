//
//  Game_Element.m
//  Sample
//
//  Created by Skav on 4/8/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "Game_Element.h"
@interface Game_Element(){
    
}
@end

@implementation Game_Element
@synthesize sElementId;
//initialize
-(id)initWithElementId:(NSString *)_sElementId {
    self = [super init];
    if (self){
        self.sElementId = _sElementId;
    }
    return self;
}
@end
