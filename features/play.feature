Feature: Start Game Play
  As a Tennis Referee
  I want to keep track of the scores
  So I can update the audience and know when the game finishes

Scenario Outline: Can't start game without player names
  Given I am on the Welcome Screen
  When I touch "<scoreButton>"
  Then I see the text "<errorMessage>"

  Examples:
    | scoreButton  | errorMessage                 |
    | player1score | Player1 name cannot be blank |
    | player2score | Player2 name cannot be blank |

Scenario Outline: Scoring and Win
  Given I am on the Welcome Screen
  And player1 is "Joseph"
  And player2 is "Jackson"
  When player1 scored <score1> times and player2 scored <score2> times
  Then I see the text "<scoreBoard>"

  Examples:
    | score1 | score2 | scoreBoard        |
    | 1      | 1      | Fifteen All       |
    | 2      | 2      | Thirty All        |
    | 3      | 3      | Deuce             |
    | 4      | 4      | Deuce             |
    | 1      | 0      | Fifteen Love      |
    | 0      | 1      | Love Fifteen      |
    | 2      | 0      | Thirty Love       |
    | 0      | 2      | Love Thirty       |
    | 3      | 0      | Forty Love        |
    | 0      | 3      | Love Forty        |
    | 4      | 0      | Joseph wins       |
    | 0      | 4      | Jackson wins      |
    | 2      | 1      | Thirty Fifteen    |
    | 1      | 2      | Fifteen Thirty    |
    | 3      | 1      | Forty Fifteen     |
    | 1      | 3      | Fifteen Forty     |
    | 4      | 1      | Joseph wins       |
    | 1      | 4      | Jackson wins      |
    | 3      | 2      | Forty Thirty      |
    | 2      | 3      | Thirty Forty      |
    | 4      | 2      | Joseph wins       |
    | 2      | 4      | Jackson wins      |
    | 4      | 3      | Joseph Advantage  |
    | 3      | 4      | Jackson Advantage |
    | 5      | 4      | Joseph Advantage  |
    | 4      | 5      | Jackson Advantage |
    | 15     | 14     | Joseph Advantage  |
    | 14     | 15     | Jackson Advantage |
    | 6      | 4      | Joseph wins       |
    | 4      | 6      | Jackson wins      |
    | 16     | 14     | Joseph wins       |
    | 14     | 16     | Jackson wins      |
