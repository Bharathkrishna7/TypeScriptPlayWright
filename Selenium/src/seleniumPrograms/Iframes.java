package seleniumPrograms;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class Iframes {

	public static void main(String[] args) {
		 System.setProperty("webdriver.chrome.driver",
					"C:\\Users\\Gowtham Krishna\\Desktop\\Browser drivers\\chromedriver_win32\\chromedriver.exe");
		 WebDriver driver=new ChromeDriver();
		 driver.get("https://dramacool.pe/catch-the-ghost-episode-7.html");
		 
		 driver.findElement(By.xpath("//img[contains(@title,'Dramacool')]")).click();
		 
		
		

	}

}
