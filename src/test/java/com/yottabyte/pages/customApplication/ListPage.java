package com.yottabyte.pages.customApplication;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "yw-subpage-normal-btn")
    private WebElement createButton;

    public WebElement getCreateButton() {
        return createButton;
    }
}