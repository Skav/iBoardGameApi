//
//  Cards_Element.h
//  Sample
//
//  Created by Skav on 4/8/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game_Element.h"

@interface Cards_Element : Game_Element{
    NSString *sCardId;
}
@property (retain) NSString *sCardId;
-(id)initWithElementId:(NSString *)_sElementId andCardId:(NSString *)_sCardId;
@end
