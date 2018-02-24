package com.yottabyte.stepDefs;

import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import org.openqa.selenium.WebElement;

import java.util.List;

public class IChooseValueFromSelectList {
    @And("^I choose the \"([^\"]*)\" from the \"([^\"]*)\"$")
    public void iChooseTheFromThe(List<String> values, String selectListName){
        if (values.size() == 1){
            String value = values.get(0);
            if (value != null && value.trim().length() != 0){
                List<WebElement> fatherSelectList = GetElementFromPage.getWebElementsWithName(selectListName);
                for (WebElement e : fatherSelectList){
                    if (value.equalsIgnoreCase(e.getText())){
                        e.click();
                    }
                }
            }
        }else {
            for (String s : values){
                List<WebElement> fatherSelectList = GetElementFromPage.getWebElementsWithName(selectListName);
                for (WebElement e : fatherSelectList){
                    if (s.equalsIgnoreCase(e.getText())){
                        e.click();
                    }
                }
            }
        }

    }
}