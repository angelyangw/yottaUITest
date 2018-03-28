Feature: 创建一个用户

  Background:
    Given I click the "UserGroupsPage" button
    And I will see the "userGroups.ListPage" page
    And There is a "thereIsAUserGroup" with "name(String):AutoTest;owner(List):admin;role(List):admin"
    And I will see the "PublicNavBarPage" page
    And I click the "UsersPage" button
    And I will see the "users.ListPage" page
    And There is a "thereIsNoUser" with "name(String):autoTest"

  @usergroups
  Scenario Outline:
    Given need run condition "<NeedRun>" There is a "thereIsAUser" with "name(String):AutoTest;fullname(String): ;email(String):autoTest@yottabyte.cn;telephone(String): ;password(String):qqqqq11111;userGroup(List):admin"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "<UserName>"
    And I set the parameter "FullName" with value "<FullName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Telephone" with value "<Telephone>"
    And I set the parameter "Password" with value "<Password>"
    And I choose the "<UserGroups>" from the "UserGroups"
    And I click the "CreateButton" button
    Then I will see the <Result>

  @smoke @all
  Examples: 成功添加一个用户
    |NeedRun|UserName|FullName        |Email                |Telephone  |Password  |UserGroups    |Result|
    |N      |AutoTest|autoTestFullName|autoTest@yottabyte.cn|           |qqqqq11111|autoTest      |success message "创建成功"|
    |N      |AutoTest|                |autoTest@yottabyte.cn|13111111111|qqqqq11111|admin,autoTest|success message "创建成功"|

  @all
  Examples: 添加用户失败
    |NeedRun|UserName|FullName        |Email                |Telephone  |Password  |UserGroups    |Result|
    |N      |        |autoTestFullName|autoTest@yottabyte.cn|           |qqqqq11111|autoTest      |error message "用户名 不能为空"|
    |N      |AutoTest|autoTestFullName|                     |           |qqqqq11111|autoTest      |error message "邮箱地址 不能为空"|
    |N      |AutoTest|autoTestFullName|autoTest             |13111111111|qqqqq11111|autoTest      |error message "邮箱地址 不合法"|
    |N      |AutoTest|                |autoTest@aa.         |           |qqqqq11111|autoTest      |error message "邮箱地址 不合法"|
    |N      |AutoTest|                |autoTest@.cn         |           |qqqqq11111|autoTest      |error message "邮箱地址 不合法"|
    |N      |AutoTest|                |autoTest.cn          |           |qqqqq11111|autoTest      |error message "邮箱地址 不合法"|
    |N      |AutoTest|                |autoTest@yottabyte.cn|           |          |autoTest      |error message "密码 不能为空"|
    |N      |AutoTest|                |autoTest@yottabyte.cn|           |qqqqqq1   |autoTest      |error message "密码输入有误，请重新输入"|
    |N      |AutoTest|                |autoTest@yottabyte.cn|           |qqqqqqqq  |autoTest      |error message "密码输入有误，请重新输入"|
    |N      |AutoTest|                |autoTest@yottabyte.cn|           |11111111  |autoTest      |error message "密码输入有误，请重新输入"|
    |N      |AutoTest|                |autoTest@yottabyte.cn|           |qqqqqqqq111111111|autoTest|error message "密码输入有误，请重新输入"|
    |N      |AutoTest|                |autoTest@yottabyte.cn|           |qqqqq11111|              |error message "用户分组 不能为空"|
    |Y      |AutoTest|                |autoTest@rizhiyi.com |           |qqqqq11111|autoTest      |error message "用户名已存在\n错误码: FE_532"|
    |Y      |AutoTest|                |autoTest@yottabyte.cn|           |qqqqq11111|autoTest      |error message "邮件名已存在\n错误码: FE_533"|
