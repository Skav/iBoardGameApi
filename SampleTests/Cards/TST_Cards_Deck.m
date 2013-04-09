//
//  TST_Cards_Deck.m
//  Sample
//
//  Created by Skav on 4/9/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "TST_Cards_Deck.h"
#import "Cards_Deck.h"
#import "Cards_Element.h"
@implementation TST_Cards_Deck

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(Cards_Element *)createCard:(NSInteger)iId{
    NSString *sId = [NSString stringWithFormat:@"id_%d",iId];
    return[[Cards_Element alloc]initWithElementId:sId
                                        andCardId:sId];
}
-(NSArray *)createArrayOfCards:(NSInteger)numberOfCards{
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:numberOfCards];
    for (int i=0; i<numberOfCards; i++) {
       [array addObject:[self createCard:i]];
    }
    return [NSArray arrayWithArray:array];
}

- (void)testInitialisation
{
    // Initialisation with a nil array of cards
    Cards_Deck *deckEmpty = [[Cards_Deck alloc] initWithCards:nil Shuffle:NO];
    STAssertNotNil(deckEmpty, @"The Deck is nil. Not cool");
    STAssertTrue([deckEmpty countCardsInDeck] == 0 , @"The Deck is not Empty");
    
    // Initialisation with an Empty array of cards
    deckEmpty = [[Cards_Deck alloc] initWithCards:[[NSArray alloc]initWithObjects:nil] Shuffle:YES];
    STAssertNotNil(deckEmpty, @"The Deck is nil. Not cool");
    STAssertTrue([deckEmpty countCardsInDeck] == 0 , @"The Deck is not Empty");
    
    // Initialisation with an array of 1 card
    NSArray *cards = [self createArrayOfCards:1];
    Cards_Deck *deckOneCard = [[Cards_Deck alloc] initWithCards:cards Shuffle:NO];
    STAssertNotNil(deckOneCard, @"The Deck is nil. Not cool");
    STAssertFalse([deckOneCard countCardsInDeck] == 0 , @"The Deck is empty");
    STAssertTrue([deckOneCard countCardsInDeck] == 1 , @"The Deck has invalid number of cards");
    
    // Initialisation with an array of 10 card
    cards = [self createArrayOfCards:10];
    Cards_Deck *deckTenCards = [[Cards_Deck alloc] initWithCards:cards Shuffle:NO];
    STAssertNotNil(deckTenCards, @"The Deck is nil. Not cool");
    STAssertFalse([deckTenCards countCardsInDeck] == 0 , @"The Deck is empty");
    STAssertTrue([deckTenCards countCardsInDeck] == 10 , @"The Deck has invalid number of cards");
    // test if cards are in the right order
    for (int i= 0; i<[deckTenCards countCardsInDeck]; i++) {
        Cards_Element *selectedCard = [deckTenCards getCardAtIndex:i];
        NSString *sId = [NSString stringWithFormat:@"id_%d",i];
        STAssertTrue([[selectedCard sCardId] isEqualToString:sId], [NSString stringWithFormat:@"The Deck has misplaced cards expected id : %@ retrieved id: %@",[selectedCard sCardId], sId]);
    }
    
    cards = [self createArrayOfCards:9001];
    Cards_Deck *deckItsOverNineThousandCards = [[Cards_Deck alloc] initWithCards:cards Shuffle:YES];
    STAssertNotNil(deckItsOverNineThousandCards, @"The Deck is nil. Not cool");
    STAssertFalse([deckItsOverNineThousandCards countCardsInDeck] == 0 , @"The Deck is empty");
    STAssertTrue([deckItsOverNineThousandCards countCardsInDeck] == 9001 , @"The Deck has invalid number of cards");
    // test if cards are in the right order
    BOOL everyThingsAreTheSame = YES;
    for (int i= 0; i<[deckItsOverNineThousandCards countCardsInDeck]; i++) {
        Cards_Element *selectedCard = [deckItsOverNineThousandCards getCardAtIndex:i];
        NSString *sId = [NSString stringWithFormat:@"id_%d",i];
        if (![[selectedCard sCardId] isEqualToString:sId]) {
            everyThingsAreTheSame = NO;
        }
    }
    STAssertFalse(everyThingsAreTheSame, @"The Deck has not been shuffle");


}
@end
