#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTennisGame:[[TennisGame alloc] init]];
    self.player1Name.delegate = self;
    self.player2Name.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)player1Score {
    @try {
        [self dismissTextField];
        [self.tennisGame player1Scored];
        [self.scoreLabel setText:[self.tennisGame getScore]];
        [self setScoreButtonEnable];
    }
    @catch (NSException *exception) {
        [self displayException:exception];
    }
}

- (IBAction)player2Score {
    @try {
        [self dismissTextField];
        [self.tennisGame player2Scored];
        [self.scoreLabel setText:[self.tennisGame getScore]];
        [self setScoreButtonEnable];
    }
    @catch (NSException *exception) {
        [self displayException:exception];
    }
}

- (void) dismissTextField {
    [self.player1Name resignFirstResponder];
    [self.player2Name resignFirstResponder];
}

- (void)setScoreButtonEnable {
    [self.player1ScoreButton setEnabled:[self.tennisGame inGameOn]];
    [self.player2ScoreButton setEnabled:[self.tennisGame inGameOn]];
}

- (void)displayException:(NSException *)exception {
    [self.scoreLabel setText:exception.reason];
    [self.player1Name setEnabled:[self.player1Name.text isEqualToString:@""]];
    [self.player2Name setEnabled:[self.player2Name.text isEqualToString:@""]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.player1Name) {
        [self.tennisGame player1Is:self.player1Name.text];
    }
    if (textField == self.player2Name) {
        [self.tennisGame player2Is:self.player2Name.text];
    }
    [textField setEnabled:[textField.text isEqualToString:@""]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end