package seleniumPrograms;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

public class SeleniumDriver {

	public static void main(String[] args) {
		// chrome
		System.setProperty("webdriver.chrome.driver",
				"C:\\Users\\Gowtham Krishna\\Desktop\\Browser drivers\\chromedriver_win32\\chromedriver.exe");

		WebDriver driver = new ChromeDriver();
		driver.get("https://youtube.com/");
		// driver.quit();
		String title = driver.getTitle();
		System.out.println(title);
	
		if (title.equals("YouTube")) {
			System.out.println("correct title");
		} else {
			System.out.println("in-correct");
		}

		// firefox
		System.setProperty("webdriver.gecko.driver", "C:\\Users\\Gowtham Krishna\\Desktop\\Browser drivers\\geckodriver-v0.29.1-win64\\geckodriver.exe");

		FirefoxDriver ff = new FirefoxDriver();
		ff.get("https://www.youtube.com/");
		// driver.quit();
	}

}
