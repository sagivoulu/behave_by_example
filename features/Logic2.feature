@instant
Feature: Logic2
  Same as Logic feature, a copy

  Scenario Outline: Or gate
    Given The values <bool1> & <bool2>
    When I apply an Or gate
    Then The result should be <res>

  Examples:
    | bool1 | bool2 | res   |
    | False | False | False |
    | False | True  | True  |
    | True  | False | True  |
    | True  | True  | True  |

  Scenario Outline: And gate
    Given The values <bool1> & <bool2>
    When I apply an And gate
    Then The result should be <res>

  Examples:
    | bool1 | bool2 | res   |
    | False | False | False |
    | False | True  | False  |
    | True  | False | False  |
    | True  | True  | True  |