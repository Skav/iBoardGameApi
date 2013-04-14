//
//  Cards_Deck.m
//  Sample
//
//  Created by Skav on 4/8/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "Cards_Deck.h"
#import "NSMutableArray_Shuffling.h"
#import "NSArray_Reverse.h"
#define TOP_INDEX -1

@interface Cards_Deck()
    @property(retain) NSMutableDictionary *indexCards;
    @property(retain) NSMutableArray *arrDeck;
@end

@implementation Cards_Deck
@synthesize indexCards;
@synthesize arrDeck;


//initialize
-(id)initWithCards:(NSArray*)initialCards Shuffle:(BOOL)bShuffle{
    DDLogVerbose(@"A new Deck is creating !");
    self = [super init];
    if (self){
        self.indexCards = [[NSMutableDictionary alloc] initWithCapacity:0];
        self.arrDeck = [[NSMutableArray alloc] initWithCapacity:0];
        [self addCards:initialCards ];// have to reverse the array for initialisation : to improve
        if(bShuffle){
            [self shuffleDeck];
        }
    }
    return self;
}

//Deck Manager
-(BOOL)addCard:(Cards_Element*)card{
    return [self addCard:card AtPosition:[self countCardsInDeck]];
}
-(BOOL)addCards:(NSArray*)arrCards{
    return [self addCards:arrCards AtPosition:TOP_INDEX];
}
-(BOOL)addCard:(Cards_Element*)card AtPosition:(NSInteger)placeToInsert{
    if(placeToInsert>[self countCardsInDeck] || placeToInsert<0){
        DDLogCError(@"Out of deck position !!!");
        @throw [NSException exceptionWithName:@"Invalid Position" reason:@"The place to insert is not correct : it should be beetween 0 and countCardsInDeck" userInfo:nil];
    }
    if (card != nil) {
        DDLogVerbose(@"A new Card %@ is been inserting in the deck at pos %d !",card,placeToInsert);
        [self.indexCards setValue:card forKey: card.sCardId];
        [self.arrDeck insertObject:card.sCardId atIndex:placeToInsert];
        return YES;
    }
    return NO;
}
-(BOOL)addCards:(NSArray*)arrCards AtPosition:(NSInteger)placeToInsert{
    if ([arrCards count] == 0) {
        return NO;
    }
    BOOL insertResult = YES;
    arrCards = [arrCards reversedArray];// have to reverse the order of array
    for(int i = 0; i<[arrCards count]; i++){
        NSObject *object = [arrCards objectAtIndex:i];
        if([object isKindOfClass:[Cards_Element class]]){
            if(placeToInsert == TOP_INDEX){
                placeToInsert = [self.arrDeck count];
            }
            BOOL insertStatementResult = [self addCard:((Cards_Element*)object)
                                            AtPosition:placeToInsert];
            if (insertStatementResult == NO) {
                DDLogCWarn(@"Fail to insert a card object : %@",[object description]);
                insertResult = NO;
            }
        }
        else{
            DDLogCWarn(@"The Deck has non card object : %@",[object description]);
        }
    }
    return insertResult;
}

-(BOOL)removeCard:(Cards_Element*)card{
    return NO;
}
-(BOOL)removeCards:(NSArray*)arrCards{
    return NO;
}
-(BOOL)removeCardAtPosition:(NSInteger)placeToDelete{
    return NO;
}
-(BOOL)removeCardsAtPositions:(NSArray*)placesToDeletes{
    return NO;
}

//Shuffle
-(void)shuffleDeck{
    [self.arrDeck shuffle];
}
-(void)shuffleCardsInRange:(NSRange)range{
   
}

//Look
-(NSArray*)lookTopCard{
    return nil;
}
-(NSArray*)lookCardsInRange:(NSRange)range;{
    return nil;
}

//Show
-(NSArray*)showTopCard{
    return nil;
}
-(NSArray*)showCardsInRange:(NSRange)range;{
    return nil;
}

//Draw cards ! important Draw cards remove cards
-(Cards_Element*)drawTopCard{
    return nil;
}
-(NSArray*)drawXCardsFromTop:(NSInteger)iCards{
    return nil;
}

//Get specific Cards ! important GetCard dont remove cards from deck
-(Cards_Element*)getCardWitCardId:(NSString*)cardId{
    return nil;
}
-(NSArray*)getCardsWithCardId:(NSString*)cardId{
    return nil;
}
-(Cards_Element*)getCardWithElementId:(NSString*)cardId{
    return nil;
}
-(Cards_Element*)getCardAtIndex:(NSInteger)index{
    NSString *sId = [self.arrDeck objectAtIndex:index];
    return [self.indexCards valueForKey:sId];
}

// Counting
-(NSInteger)countCardsInDeck{
    return [self.arrDeck count];
}


@end
