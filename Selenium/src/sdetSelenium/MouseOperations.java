package sdetSelenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;

import io.github.bonigarcia.wdm.WebDriverManager;

public class MouseOperations {
	
	public static void main(String []args) {
		
		WebDriverManager.chromedriver().setup();
		
		WebDriver driver =new ChromeDriver();
		
		driver.manage().window().maximize();
		
		driver.get("https://demo.guru99.com/test/simple_context_menu.html");
		
	//for right click
		WebElement element=driver.findElement(By.xpath("//span[text()='right click me']"));
		
		Actions ac=new Actions(driver);
  
		ac.contextClick(element).build().perform();// We no need to use build here
		//context click will perform right click action
	driver.navigate().refresh();
		
	//for double click
		WebElement doubleclick=driver.findElement(By.xpath("//button[text()='Double-Click Me To See Alert']"));
		
		ac.doubleClick(doubleclick).perform();
	driver.close();
	
		
//	driver.manage().timeouts().pageLoadTimeout(10, TimeUnit.SECONDS);
/*
		//drag and drop
	driver.get("http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html");
	
	driver.manage().window().maximize();
	
	WebElement sour=driver.findElement(By.xpath("//div[@id='box5']"));
	
	WebElement destination=driver.findElement(By.xpath("//div[@id='box105']"));
	
	ac.dragAndDrop(sour, destination);
	
	*/
	}
}
