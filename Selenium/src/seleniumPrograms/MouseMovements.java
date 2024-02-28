package seleniumPrograms;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;

public class MouseMovements {

	public static void main(String[] args) throws InterruptedException {
		System.setProperty("webdriver.chrome.driver",
				"D:\\Browser drivers\\chromedriver_win32 94\\chromedriver.exe");
	 WebDriver driver=new ChromeDriver();
	/* driver.manage().window().maximize();
	 driver.manage().deleteAllCookies();*/
	
	 driver.get("https://html.com/");
	 
	 Actions Action=new Actions(driver);
	/* Action.moveToElement(driver.findElement(By.xpath("//a[contains(@class,mega-indicator)]"))).build().perform();
	 Thread.sleep(2000);
	 driver.findElement(By.linkText("HTML5")).click();
	 */
	 
	 Action.moveToElement(driver.findElement(By.xpath("//a[contains(@class,mega-menu-link)]"))).build().perform();
	 Thread.sleep(2000);
	 Action.moveToElement(driver.findElement(By.xpath("//a[contains(@aria-haspopup,true)]"))).build().perform();
	 Thread.sleep(2000);
	 //Action.moveToElement(driver.findElement(By.xpath("//a[contains(@class,mega-menu-link)]"))).build().perform();
 
	}

}
