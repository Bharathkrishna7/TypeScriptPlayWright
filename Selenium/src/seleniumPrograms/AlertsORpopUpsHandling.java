package seleniumPrograms;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class AlertsORpopUpsHandling {


	public static void main(String[] args) throws InterruptedException {
	System.setProperty("webdriver.chrome.driver",
				"C:\\Users\\Gowtham Krishna\\Desktop\\Browser drivers\\chromedriver_win32\\chromedriver.exe");

		WebDriver driver = new ChromeDriver();
		driver.get("https://www.humintglobal.com/Contact/Contact.html");
		driver.findElement(By.xpath("//button[@class='btn btn-lg btn-primary']")).click();
		
		Alert a=driver.switchTo().alert();
		System.out.println(a.getText());  
		Thread.sleep(5000);
		  a.accept();

   /*       
		if(a.equals("Enter Value")) {
			System.out.println("Alert working fine");
		}
		else {
			System.out.println("some problem is there in alert");
		}
		*/
  
	}

}
