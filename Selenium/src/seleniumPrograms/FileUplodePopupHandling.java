package seleniumPrograms;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class FileUplodePopupHandling {

	public static void main(String[] args) {
		System.setProperty("webdriver.chrome.driver",
				"C:\\Users\\Gowtham Krishna\\Desktop\\Browser drivers\\chromedriver_win32\\chromedriver.exe");

		WebDriver driver = new ChromeDriver();
		driver.get("https://html.com/input-type-file/");
		driver.findElement(By.id("fileupload")).sendKeys("C:\\Users\\Gowtham Krishna\\Desktop\\Today.txt");
		

	}

}
