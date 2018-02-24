Feature: 导入一个资源包

  Background:
    Given I click the "ResourceGroupsPage" button
    Then I will see the "resourceGroups.ListPage" page

  @somke @all @resourcegroups
  Scenario Outline: 导入资源包的正常流程测试
    Given I click the "UploadButton" button
    When I upload a file with name "<InputFileName>"
    And I click the "<ButtonType>" button
    And I choose the "<Owner>" from the "ResourceGroupOwner"
    And I click the "OKButton" button
    Then I will see the success message "导入成功"

  Examples:
    |InputFileName|ButtonType|Owner|
    |/src/test/resources/testdata/resourceGroups/success.tar|BothSaveButton|admin|
    |/src/test/resources/testdata/resourceGroups/success.tar|NotCoverButton|hunter_roles_manager|
    |/src/test/resources/testdata/resourceGroups/success.tar|CoverButton|admin,autotest|
    |/src/test/resources/testdata/resourceGroups/success.tar||autotest|

  @all @resourcegroups
  Scenario Outline: 导入资源包的异常流程测试-导入的文件格式不正确
    Given I click the "UploadButton" button
    When I upload a file with name "<InputFileName>"
    Then I will see the error message "<ErrorMessage>"

  Examples:
    |InputFileName|ErrorMessage|
    |/src/test/resources/testdata/resourceGroups/testcase.txt|仅支持 .tar 格式文件|
    |/src/test/resources/testdata/resourceGroups/testcase.tar.gz|仅支持 .tar 格式文件|
    |/src/test/resources/testdata/resourceGroups/testcase.tar|未知错误，请检查文件格式及内容是否正确，然后重新上传|


  @all @resourcegroups
  Scenario Outline: 导入资源包的异常流程测试-导入的文件格式不正确
    Given I click the "UploadButton" button
    When I upload a file with name "<InputFileName>"

  Examples:
    |InputFileName|
