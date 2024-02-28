package seleniumPractice;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

public class CustomizedORDynamicXpath {

	public static void main(String[] args) {
		System.setProperty("webdriver.chrome.driver",
				"C:\\Users\\Gowtham Krishna\\Desktop\\Browser drivers\\chromedriver_win32\\chromedriver.exe");
  
		WebDriver driver = new ChromeDriver();
		driver.get("https://beta.spicejet.com/");
		 //driver.manage().window().maximize();
		 driver.manage().deleteAllCookies();
		 driver.manage().timeouts().pageLoadTimeout(20, TimeUnit.SECONDS);
		 driver.manage().timeouts().implicitlyWait(25, TimeUnit.SECONDS);
		 
 //normal xpath
		 Select s=new Select(driver.findElement(By.xpath("//input[@type='text']")));
		// Select s=new Select(driver.findElement(By.xpath("//select[contains(text(),'Bhopal')]")));
		//Select s=new Select(driver.findElement(By.xpath("//select[contains(@class,'css-76zvg2 r-1xedbs3 r-ubezar')]")));
		 s.selectByVisibleText("Ahmedabad");
		 //dynamic xpath
		// driver.findElement(By.xpath("//div[contains(@data-testid,'home-page-flight-cta')]")).click();
 //Text xpath


	}
	

}
