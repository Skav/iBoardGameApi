//
//  Cards_Deck.m
//  Sample
//
//  Created by Skav on 4/8/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "Cards_Deck.h"
#import "NSMutableArray_Shuffling.h"
#define TOP_INDEX 0

@interface Cards_Deck()
    @property(retain) NSMutableDictionary *indexCards;
    @property(retain) NSMutableArray *arrDeck;
@end

@implementation Cards_Deck
@synthesize indexCards;
@synthesize arrDeck;


//initialize
-(id)initWithCards:(NSArray*)initialCards Shuffle:(BOOL)bShuffle{
    self = [super init];
    if (self){
        self.indexCards = [[NSMutableDictionary alloc] initWithCapacity:0];
        self.arrDeck = [[NSMutableArray alloc] initWithCapacity:0];
        [self addCards:initialCards];
        if(bShuffle){
            [self shuffleDeck];
        }
    }
    return self;
}

//Deck Manager
-(BOOL)addCard:(Cards_Element*)card{
    [self addCard:card AtPosition:TOP_INDEX];
    return YES;
}
-(BOOL)addCards:(NSArray*)arrCards{
    for(Cards_Element *card in arrCards){
        [self addCard:card];
    }
    return true;
}
-(BOOL)addCard:(Cards_Element*)card AtPosition:(NSInteger)placeToInsert{
    [self.indexCards setValue:card forKey: card.sCardId];
    [self.arrDeck insertObject:card.sCardId atIndex:placeToInsert];
    return YES;
}
-(BOOL)addCards:(NSArray*)arrCards AtPosition:(NSInteger)placeToInsert{
    for(Cards_Element *card in arrCards){
        [self addCard:card AtPosition:placeToInsert];
        placeToInsert++;
    }
    return YES;
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
-(Cards_Element*)drawFirstCard{
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
