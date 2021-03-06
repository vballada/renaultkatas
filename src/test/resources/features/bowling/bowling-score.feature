Feature: Bowling score

  Scenario: Compute score when all pins missed
    Given All pins missed
    When I compute the score
    Then The score is 0

  Scenario: Compute score when only one pin in first throw fell
    Given First pin of first throw fell
    When I compute the score
    Then The score is 1

  Scenario: Compute score when two pins in first throw fell
    Given Two pins of first throw fell
    When I compute the score
    Then The score is 2

  Scenario Template: Compute score when less than ten pins fell in the two first throws
    Given the first frame is "<first frame>"
    When I compute the score
    Then The score is <expected score>
    Examples:
      | first frame | expected score |
      | 2,1         | 3              |
      | 3,1         | 4              |
      | 3,2         | 5              |

  Scenario Template: Compute score when each frame is below ten
    Given the frames are "<pins>"
    When I compute the score
    Then The score is <expected score>
    Examples:
      | pins                                    | expected score |
      | 1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0 | 2              |
      | 1,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,0,0,0,0 | 4              |

  Scenario Template: Compute score when the first frame is a spare
    Given the frames are "<pins>"
    When I compute the score
    Then The score is <expected score>
    Examples:
      | pins                                    | expected score |
      | 1,9,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 | 12             |
      | 1,9,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 | 14             |
      | 2,8,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 | 15             |
      | 2,8,9,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 | 33             |
