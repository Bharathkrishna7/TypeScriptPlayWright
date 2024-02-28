package seleniumPractice;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import io.github.bonigarcia.wdm.WebDriverManager;

public class FrameAndIframe {

// Iframe used to insert contents from "other sources"(it belongs to other website)
	public static void main(String[] args) {

		WebDriverManager.chromedriver().setup();

		WebDriver driver = new ChromeDriver();

		driver.get("https://demo.automationtesting.in/Register.html");
		
		driver.manage().window().maximize();
		driver.findElement(By.xpath("//a[text()='SwitchTo']")).click();
		driver.findElement(By.xpath("//a[text()='Frames']")).click();
		

	}

}