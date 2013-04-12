//
//  Cards_Deck.h
//  Sample
//
//  Created by Skav on 4/8/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "Game_Element.h"
#import "Cards_drawProtocol.h"
#import "Cards_Element.h"
@interface Cards_Deck : Game_Element<Cards_drawProtocol>{
    NSMutableDictionary *indexCards;
    NSMutableArray *arrDeck;
}

//initialize
-(id)initWithCards:(NSArray*)initialCards Shuffle:(BOOL)bShuffle;
//Deck Manager
-(BOOL)addCard:(Cards_Element*)card;
-(BOOL)addCards:(NSArray*)arrCards;
-(BOOL)addCard:(Cards_Element*)card AtPosition:(NSInteger)placeToInsert;
-(BOOL)addCards:(NSArray*)arrCards AtPosition:(NSInteger)placeToInsert;

-(BOOL)removeCard:(Cards_Element*)card;
-(BOOL)removeCards:(NSArray*)arrCards;
-(BOOL)removeCardAtPosition:(NSInteger)placeToDelete;
-(BOOL)removeCardsAtPositions:(NSArray*)placesToDeletes;

//Shuffle
-(void)shuffleDeck;
-(void)shuffleCardsInRange:(NSRange)range;

//Look
-(Cards_Element*)lookTopCard;
-(NSArray*)lookCardsInRange:(NSRange)range;

//Show
-(Cards_Element*)showTopCard;
-(NSArray*)showCardsInRange:(NSRange)range;

//Draw cards
-(Cards_Element*)drawTopCard;
-(NSArray*)drawXCardsFromTop:(NSInteger)iCards;

//Get specific Cards
-(Cards_Element*)getCardWitCardId:(NSString*)cardId;
-(NSArray*)getCardsWithCardId:(NSString*)cardId;
-(Cards_Element*)getCardWithElementId:(NSString*)cardId;
-(Cards_Element*)getCardAtIndex:(NSInteger)index;

// Counting
-(NSInteger)countCardsInDeck;

@end
