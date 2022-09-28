@interview-test
Feature: Launch browser
  Scenario: Launch home page
    Given visit home page
    When user fill in "komputer" on the search field
    When User click Produk Terlaris tab
    When User choose first product on the list
    When user fill in "3" quantity of product
    When User change courier
    When User cancel to choose a courier
    Then User undo the order and not to continue for purchasing