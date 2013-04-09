//
//  Game_Element.h
//  Sample
//
//  Created by Skav on 4/8/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game_Element : NSObject{
    NSString *sElementId;
    
}
@property (retain) NSString *sElementId;

-(id)initWithElementId:(NSString *)_sElementId;
@end
