package seleniumPrograms;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;


public class Dropdownhandling {

	public static void main(String[] args) throws InterruptedException {
		
		 System.setProperty("webdriver.chrome.driver",
					"C:\\Users\\Gowtham Krishna\\Desktop\\Browser drivers\\chromedriver_win32\\chromedriver.exe");
		 WebDriver driver=new ChromeDriver();
	/*	 driver.get("https://beta.spicejet.com/");
		 driver.findElement(By.xpath("//div[contains(@class,css-1dbjc4n r-1awozwy r-18u37iz r-1wtj0ep)]")).click();
		 Thread.sleep(2000);
		 driver.findElement(By.xpath("//div[contains(@data-focusable,true)]")).click(); */
	 driver.get("https://www.facebook.com/r.php");
	   Select s=new Select(driver.findElement(By.id("day")));
		 s.selectByValue("16");
		 Thread.sleep(2000);
		/*Select s1=new Select(driver.findElement(By.id("month")));
		s1.sel("jun");
		Thread.sleep(2000);*/
		Select s2=new Select(driver.findElement(By.id("year")));
		s2.selectByVisibleText("1994");
		s2.selectByIndex(28);
		
		
	}
}
