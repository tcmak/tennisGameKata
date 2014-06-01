#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTennisGame:[[TennisGame alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)player1Score {
    @try {
        [self.tennisGame player1Scored];
        [self.scoreLabel setText:[self.tennisGame getScore]];
        [self.player1ScoreButton setEnabled:[self.tennisGame inGameOn]];
        [self.player2ScoreButton setEnabled:[self.tennisGame inGameOn]];
    }
    @catch (NSException *exception) {
        [self.scoreLabel setText:exception.reason];
        [self.player1Name setEnabled:[self.player1Name.text isEqualToString:@""]];
        [self.player2Name setEnabled:[self.player2Name.text isEqualToString:@""]];
    }
}

- (IBAction)player2Score {
    @try {
        [self.tennisGame player2Scored];
        [self.scoreLabel setText:[self.tennisGame getScore]];
        [self.player1ScoreButton setEnabled:[self.tennisGame inGameOn]];
        [self.player2ScoreButton setEnabled:[self.tennisGame inGameOn]];
    }
    @catch (NSException *exception) {
        [self.scoreLabel setText:exception.reason];
        [self.player1Name setEnabled:[self.player1Name.text isEqualToString:@""]];
        [self.player2Name setEnabled:[self.player2Name.text isEqualToString:@""]];
    }
}

- (IBAction)player1Is {
    [self.tennisGame player1Is:self.player1Name.text];
    [self.player1Name setEnabled:[self.player1Name.text isEqualToString:@""]];
}

- (IBAction)player2Is {
    [self.tennisGame player2Is:self.player2Name.text];
    [self.player2Name setEnabled:[self.player2Name.text isEqualToString:@""]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end