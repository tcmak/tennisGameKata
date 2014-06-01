#import <XCTest/XCTest.h>
#import "TennisGame.h"

@interface TennisGameTests : XCTestCase

@property(nonatomic, strong) TennisGame *tennisGame;
@end

@implementation TennisGameTests {
    NSArray *scoreName;
}

- (void)setUp {
    [super setUp];
    [self setTennisGame:[[TennisGame alloc] init]];
    [self.tennisGame player1Is:@"Joseph"];
    [self.tennisGame player2Is:@"Jackson"];
    scoreName = @[@"Love", @"Fifteen", @"Thirty", @"Forty"];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPlayerNameIsBlank {
    TennisGame *tennisGameWithoutNames = [[TennisGame alloc] init];
    XCTAssertThrowsSpecificNamed([tennisGameWithoutNames player1Scored], NSException, @"Player1 name cannot be blank");
    [tennisGameWithoutNames player1Is:@"Terry"];
    XCTAssertThrowsSpecificNamed([tennisGameWithoutNames player2Scored], NSException, @"Player2 name cannot be blank");
}

- (void)testSomethingLove {
    for (int i = 1; i < 4; i++) {
        [self.tennisGame player1Scored];
        NSString *score = [NSString stringWithFormat:@"%@ Love", scoreName[i]];
        XCTAssertEqualObjects([self.tennisGame getScore], score);
    }
}

- (void)testLoveForty {
    [self player2scoredTimes:3];
    XCTAssertEqualObjects([self.tennisGame getScore], @"Love Forty");
}

- (void)testLoveSomething {
    for (int i = 1; i < 4; i++) {
        [self.tennisGame player2Scored];
        NSString *score = [NSString stringWithFormat:@"Love %@", scoreName[i]];
        XCTAssertEqualObjects([self.tennisGame getScore], score);
    }
}

- (void)testSomethingAll {
    for (int i = 1; i < 2; i++) {
        [self.tennisGame player1Scored];
        [self.tennisGame player2Scored];

        NSString *score = [NSString stringWithFormat:@"%@ All", scoreName[i]];
        XCTAssertEqualObjects([self.tennisGame getScore], score);
    }
}

- (void)testFortyThirty {
    [self player1scoredTimes:3];
    [self player2scoredTimes:2];
    XCTAssertEqualObjects([self.tennisGame getScore], @"Forty Thirty");
}

- (void)testDeuce {
    for (int i = 0; i < 3; i++) {
        [self.tennisGame player1Scored];
        [self.tennisGame player2Scored];
    }
    XCTAssertEqualObjects([self.tennisGame getScore], @"Deuce");

    for (int i = 0; i < 5; i++) {
        [self.tennisGame player2Scored];
        [self.tennisGame player1Scored];
        XCTAssertEqualObjects([self.tennisGame getScore], @"Deuce");
    }
}

- (void)testPlayer1StraightWins {
    [self player1scoredTimes:4];

    XCTAssertEqualObjects([self.tennisGame getScore], @"Joseph wins");
    XCTAssertEqual([self.tennisGame inGameOn], NO);
}

- (void)testPlayer1Wins {
    [self player1scoredTimes:3];
    [self player2scoredTimes:1];
    [self player1scoredTimes:1];

    XCTAssertEqualObjects([self.tennisGame getScore], @"Joseph wins");
    XCTAssertEqual([self.tennisGame inGameOn], NO);
}

- (void)testPlayer2Wins {
    [self player2scoredTimes:3];
    [self player1scoredTimes:2];
    [self player2scoredTimes:1];

    XCTAssertEqualObjects([self.tennisGame getScore], @"Jackson wins");
    XCTAssertEqual([self.tennisGame inGameOn], NO);
}

- (void)testPlayer1Advantage {
    [self player1scoredTimes:3];
    [self player2scoredTimes:3];
    [self player1scoredTimes:1];

    XCTAssertEqualObjects([self.tennisGame getScore], @"Joseph Advantage");
}

- (void)testPlayer2Advantage {
    [self player1scoredTimes:3];
    [self player2scoredTimes:3];
    [self player2scoredTimes:1];

    XCTAssertEqualObjects([self.tennisGame getScore], @"Jackson Advantage");
}

- (void)player1scoredTimes:(int)times {
    for (int i = 0; i < times; i++)
        [self.tennisGame player1Scored];
}

- (void)player2scoredTimes:(int)times {
    for (int i = 0; i < times; i++)
        [self.tennisGame player2Scored];
}

@end
