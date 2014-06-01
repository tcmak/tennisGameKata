@interface TennisGame : NSObject {
}

- (id)init;

- (void)player1Scored;

- (void)player2Scored;

- (void)player1Is:(NSString *)name;

- (void)player2Is:(NSString *)name;

- (NSString *)getScore;

- (bool)inGameOn;
@end