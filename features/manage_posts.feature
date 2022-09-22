Feature: Manage Post

    Feature Description

    Background: Create New User
      Given the following user params:
        | email        | ilham@gmail.com                 |
        | password     | 123123                          |
        | confirmed_at | Wed, 21 Sep 2022 13:14:37 +0700 |
      Then I save user

    Scenario: Create New Post
      Given the following post params:
        | title   | Testt  |
        | body    | Desc   |
        | user_id | 1      |
      When I save post
      Then I should have the following posts:
        | title | Testt  |
        | body  | Desc   |

    # Scenario: Show My Posts
    # Given I have posts
    # When I go to the my post page
    # Then I should see my own post