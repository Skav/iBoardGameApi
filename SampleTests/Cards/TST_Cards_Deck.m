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

-(Cards_Element *)createCard:(NSInteger)iId
{
    NSString *sId = [NSString stringWithFormat:@"id_%d",iId];
    return [[Cards_Element alloc]initWithElementId:sId
                                         andCardId:sId];
}
-(NSArray *)createArrayOfCards:(NSInteger)numberOfCards
{
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
    for (int i = 0; i<[deckTenCards countCardsInDeck]; i++) {
        Cards_Element *selectedCard = [deckTenCards getCardAtIndex:i];
        NSString *sId = [NSString stringWithFormat:@"id_%d",i];
        STAssertTrue([[selectedCard sCardId] isEqualToString:sId], [NSString stringWithFormat:@"The Deck has misplaced cards expected id : %@ retrieved id: %@", sId,[selectedCard sCardId]]);
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

- (void)testAddCard
{
    // Initialisation with a nil array of cards
    Cards_Deck *deckEmpty = [[Cards_Deck alloc] initWithCards:nil Shuffle:NO];
    BOOL addCardResult;
    
    // try to insert nil card ^.^
    addCardResult = [deckEmpty addCard:nil];
    STAssertFalse(addCardResult, @"Wrong result of insertion");
    
    // try to insert a card
    Cards_Element *oneCard = [self createCard:0];
    addCardResult = [deckEmpty addCard:oneCard];
    STAssertTrue(addCardResult, @"Wrong result of insertion");
    STAssertTrue([deckEmpty countCardsInDeck] == 1, @"Invalid number of cards in deck");
    // check if the card is the good one
    Cards_Element *cardPicked = [deckEmpty getCardAtIndex:0];
    STAssertTrue([cardPicked.sElementId isEqualToString:oneCard.sElementId], @"Card not good");
    
    // try to insert another card
    Cards_Element *anotherCard = [self createCard:1];
    addCardResult = [deckEmpty addCard:anotherCard];
    STAssertTrue(addCardResult, @"Wrong result of insertion");
    STAssertTrue([deckEmpty countCardsInDeck] == 2, @"Invalid number of cards in deck");
    cardPicked = [deckEmpty getCardAtIndex:0];
    STAssertTrue([cardPicked.sElementId isEqualToString:oneCard.sElementId], @"Card not good");
    Cards_Element *cardPicked2 = [deckEmpty getCardAtIndex:1];
    STAssertTrue([cardPicked2.sElementId isEqualToString:anotherCard.sElementId], @"Card not good");
}

- (void)testAddCards
{
    // Initialisation with a nil array of cards
    Cards_Deck *deckEmpty = [[Cards_Deck alloc] initWithCards:nil Shuffle:NO];
    BOOL addCardResult;
    
    // try to insert nil card ^.^
    addCardResult = [deckEmpty addCards:nil];
    STAssertFalse(addCardResult, @"Wrong result of insertion");
    STAssertTrue([deckEmpty countCardsInDeck] == 0, @"Invalid number of cards in deck");
    
    // try to insert a card
    Cards_Element *cardOne = [self createCard:0];
    Cards_Element *cardTwo = [self createCard:1];
    Cards_Element *cardThree = [self createCard:2];
    
    NSArray *cards = [NSArray arrayWithObjects:cardOne, cardTwo, cardThree, nil];
    
    addCardResult = [deckEmpty addCards:cards];
    STAssertTrue(addCardResult, @"Wrong result of insertion");
    STAssertTrue([deckEmpty countCardsInDeck] == 3, @"Invalid number of cards in deck");
    // check if the card is the good one
    Cards_Element *cardPicked1 = [deckEmpty getCardAtIndex:0];
    Cards_Element *cardPicked2 = [deckEmpty getCardAtIndex:1];
    Cards_Element *cardPicked3 = [deckEmpty getCardAtIndex:2];
    STAssertTrue([cardPicked1.sElementId isEqualToString:cardOne.sElementId],   @"Card not good");
    STAssertTrue([cardPicked2.sElementId isEqualToString:cardTwo.sElementId],   @"Card not good");
    STAssertTrue([cardPicked3.sElementId isEqualToString:cardThree.sElementId], @"Card not good");
    
    NSArray *corruptedArrayCards = [NSArray arrayWithObjects:cardOne,@"HOHO !", cardTwo, cardThree, nil];
    Cards_Deck *deckCorrupted = [[Cards_Deck alloc] initWithCards:nil Shuffle:NO];
    
    addCardResult = [deckCorrupted addCards:corruptedArrayCards];
    STAssertTrue(addCardResult, @"Wrong result of insertion");
    STAssertTrue([deckCorrupted countCardsInDeck] == 3, @"Invalid number of cards in deck");
    // check if the card is the good one
    cardPicked1 = [deckCorrupted getCardAtIndex:0];
    cardPicked2 = [deckCorrupted getCardAtIndex:1];
    cardPicked3 = [deckCorrupted getCardAtIndex:2];
    STAssertTrue([cardPicked1.sElementId isEqualToString:cardOne.sElementId],   @"Card not good");
    STAssertTrue([cardPicked2.sElementId isEqualToString:cardTwo.sElementId],   @"Card not good");
    STAssertTrue([cardPicked3.sElementId isEqualToString:cardThree.sElementId], @"Card not good");
    
    // add cards to an allready initialized deck
    Cards_Element *cardFour = [self createCard:4];
    Cards_Element *cardFive = [self createCard:5];
    Cards_Element *cardSix = [self createCard:6];
    NSArray *cards2 = [NSArray arrayWithObjects:cardFour,cardFive,cardSix, nil];
    
    // suppose to be added at the end of the deck
    addCardResult = [deckEmpty addCards:cards2];
    STAssertTrue(addCardResult, @"Wrong result of insertion");
    STAssertTrue([deckEmpty countCardsInDeck] == 6, @"Invalid number of cards in deck: %d",[deckEmpty countCardsInDeck]);
    
    Cards_Element *cardPicked4 = [deckEmpty getCardAtIndex:3];
    Cards_Element *cardPicked5 = [deckEmpty getCardAtIndex:4];
    Cards_Element *cardPicked6 = [deckEmpty getCardAtIndex:5];
    STAssertTrue([cardPicked4.sElementId isEqualToString:cardFour.sElementId], @"Card not good");
    STAssertTrue([cardPicked5.sElementId isEqualToString:cardFive.sElementId], @"Card not good");
    STAssertTrue([cardPicked6.sElementId isEqualToString:cardSix.sElementId],  @"Card not good");
    
    // suppose to be added to top
    Cards_Deck *deck2 = [[Cards_Deck alloc] initWithCards:cards2 Shuffle:NO];
    addCardResult = [deck2 addCards:cards AtPosition:0];
    STAssertTrue(addCardResult, @"Wrong result of insertion");
    STAssertTrue([deck2 countCardsInDeck] == 6, @"Invalid number of cards in deck: %d",[deck2 countCardsInDeck]);
    
    cardPicked1 = [deck2 getCardAtIndex:0];
    cardPicked2 = [deck2 getCardAtIndex:1];
    cardPicked3 = [deck2 getCardAtIndex:2];
    cardPicked4 = [deck2 getCardAtIndex:3];
    cardPicked5 = [deck2 getCardAtIndex:4];
    cardPicked6 = [deck2 getCardAtIndex:5];
    
    STAssertTrue([cardPicked1.sElementId isEqualToString:cardOne.sElementId],   @"Card not good");
    STAssertTrue([cardPicked2.sElementId isEqualToString:cardTwo.sElementId],   @"Card not good");
    STAssertTrue([cardPicked3.sElementId isEqualToString:cardThree.sElementId], @"Card not good");
    STAssertTrue([cardPicked4.sElementId isEqualToString:cardFour.sElementId],  @"Card not good");
    STAssertTrue([cardPicked5.sElementId isEqualToString:cardFive.sElementId],  @"Card not good");
    STAssertTrue([cardPicked6.sElementId isEqualToString:cardSix.sElementId],   @"Card not good");
    
}

@end
