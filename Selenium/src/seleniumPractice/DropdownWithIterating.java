package seleniumPractice;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import io.github.bonigarcia.wdm.WebDriverManager;

public class DropdownWithIterating {

	public static void main(String[] args) {
		WebDriverManager.chromedriver().setup();
		WebDriver driver = new ChromeDriver();
       driver.manage().window().maximize();
       driver.get("https://www.bstackdemo.com/");
       
       driver.findElement(By.xpath("//option[text()='Select']/..")).click();
       
       List<WebElement> alloptions=driver.findElements(By.xpath("//option[text()='Highest to lowest']"));
       
       String option="Highest to lowest";
       
       for(int i=0;i<alloptions.size();i++) {
    	   if(alloptions.get(i).getText().contains(option)) {
    		   alloptions.get(i).click();
    		   System.out.println("clicked"+alloptions.get(i).getText());
    	   }
       }
       
       //we can also use enhanced for loop
       
       for(WebElement allop:alloptions) {
    	   
    	   if(allop.getText().contains(option)) {
    		   allop.click();
    		   System.out.println(allop.getText()+"Text for foreachloop");
    	   }
	
    	   JavascriptExecutor js = (JavascriptExecutor) driver;
    	   
    	 System.out.println(js.executeScript("Highest to lowest", allop)+"for java script");  
       
	}
}
}