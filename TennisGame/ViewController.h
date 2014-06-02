#import <UIKit/UIKit.h>
#import "TennisGame.h"

@interface ViewController : UIViewController

@property(strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property(strong, nonatomic) IBOutlet UIButton *player1ScoreButton;
@property(strong, nonatomic) IBOutlet UIButton *player2ScoreButton;
@property(strong, nonatomic) IBOutlet UITextField *player1Name;
@property(strong, nonatomic) IBOutlet UITextField *player2Name;

@property(nonatomic, strong) TennisGame *tennisGame;

- (IBAction)player1Score;

- (IBAction)player2Score;

//- (IBAction)player1Is;

//- (IBAction)player2Is;

- (void)textFieldDidEndEditing:(UITextField *)textField;

@end