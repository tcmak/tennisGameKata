#import "TennisGame.h"

@implementation TennisGame {
    NSString *player1Name;
    NSString *player2Name;
    NSUInteger player1score;
    NSUInteger player2score;
    bool gameOn;
}

- (id)init {
    player1Name = @"";
    player2Name = @"";
    player1score = 0;
    player2score = 0;
    gameOn = YES;
    return self;
}

- (void)player1Is:(NSString *)name {
    player1Name = name;
}

- (void)player2Is:(NSString *)name {
    player2Name = name;
}

- (void)player1Scored {
    if ([player1Name isEqualToString:@""] )
        [NSException raise:@"Player1 name cannot be blank" format:@"Player1 name cannot be blank"];
    if ([player2Name isEqualToString:@""] )
        [NSException raise:@"Player2 name cannot be blank" format:@"Player2 name cannot be blank"];
    player1score++;
}

- (void)player2Scored {
    if ([player2Name isEqualToString:@""] )
        [NSException raise:@"Player2 name cannot be blank" format:@"Player2 name cannot be blank"];
    if ([player1Name isEqualToString:@""] )
        [NSException raise:@"Player1 name cannot be blank" format:@"Player1 name cannot be blank"];
    player2score++;
}

- (NSString *)getScore {
    if ((player1score + player2score <= 5 && abs(player1score - player2score) <= 3)
            && (player1score > player2score ? player1score : player2score)< 4)
        return [self getBasicScore];

    return [self getGameScore];

}

- (NSString *)getGameScore {
    NSArray *result = @[@"Advantage", @"wins"];
    int diff = abs(player1score-player2score) > 2 ? 2 : abs(player1score-player2score) ;

    if (diff ==0)
        return @"Deuce";

    if (diff == 2)
        gameOn = NO;

    return [NSString stringWithFormat:@"%@ %@", (player1score > player2score ? player1Name : player2Name), result[diff-1]];
}

- (NSString *)getBasicScore {
    NSArray *scoreName = @[@"Love", @"Fifteen", @"Thirty", @"Forty"];

    if (player1score == player2score)
        return [NSString stringWithFormat:@"%@ All", scoreName[player1score]];

    return [NSString stringWithFormat:@"%@ %@", scoreName[player1score], scoreName[player2score]];
}

- (bool)inGameOn {
    return gameOn;
}
@end